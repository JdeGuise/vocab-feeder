require('dotenv').config();
const schedule = require('node-schedule');
const { Pool } = require('pg');
const { WebClient } = require('@slack/web-api');

const express = require("express");
const PORT = process.env.NODE_PORT || 3001;
const app = express();

const web = new WebClient(process.env.SLACK_BOT_TOKEN);
const DEFAULT_VOCAB_BATCH_COUNT = 3;
const SEND_DAILY_SLACK_BTN_LABEL = 'Send Daily Dutch Vocab';

schedule.scheduleJob('30 07 * * *', function(){
	sendDailyDutchVocabToSlack(DEFAULT_VOCAB_BATCH_COUNT);
});

const pool = new Pool({
	host: process.env.POSTGRES_HOST,
	user: process.env.POSTGRES_USERNAME,
	password: process.env.POSTGRES_PASSWORD,
	database: process.env.POSTGRES_DATABASE_NAME,
	max: 20,
	idleTimeoutMillis: 30000,
	connectionTimeoutMillis: 2000
});

const getVocabularyRecords = async function(recordCount) {
	pool.connect((err, client, release) => {
		if(err) {
			return console.error('Error acquiring client', err.stack)
		}
		client.query('SELECT id, dutch, english, pronunciationLink FROM vocabulary WHERE seen != TRUE AND mastered != TRUE ORDER BY random() LIMIT $1', [recordCount], (err, result) => {
			release();
			if(err) {
				return console.error('Error executing query', err.stack);
			} else {
				postSlackMessage(result.rows);
				updateVocabRecordsAsSeen(result.rows);
			}
		});
	});
}

const sendDailyDutchVocabToSlack = async function(recordCount) {
	await getVocabularyRecords(recordCount);
}

const updateVocabRecordsAsSeen = async function(data) {
	const vocabIds = [];
	for(let entry in data) {
		vocabIds.push(data[entry].id);
	}
	pool.connect((err, client, release) => {
		if(err) {
			return console.error('Error acquiring client', err.stack)
		}
		client.query('UPDATE vocabulary SET seen = TRUE WHERE id = ANY($1)', [vocabIds], (err, result) => {
			release();
			if(err) {
				return console.error('Error executing query', err.stack);
			}
		});
	});
}

function resetVocabRecordsToUnseen() {
	pool.connect((err, client, release) => {
		if(err) {
			return console.error('Error acquiring client', err.stack)
		}
		client.query('UPDATE vocabulary SET seen = FALSE', (err, result) => {
			release();
			if(err) {
				return console.error('Error executing query', err.stack);
			}
			console.log('done!');
		});
	});
}

function postSlackMessage(data) {
	(async () => {
		const result = await web.chat.postMessage({
			blocks: buildDutchBlockStr(data),
			channel: process.env.SLACK_CHANNEL_CONVERSATION_ID,
			text: 'Your daily Dutch vocab has arrived!'
		});
	})();
}

function buildDutchBlockStr(data) {
	const blockStr = [
		{
			"type" : "header",
			"text": {
				"type": "plain_text",
				"emoji" : false,
				"text" : "Words for " + new Date().toLocaleString('en-US', { dateStyle: 'long' })
			}
		}
	];
	
	for(let entry in data) {
		let pronunciationString = '';
		if(data[entry].pronunciationlink === '#') {
			pronunciationString = 'No URL found';
		} else {
			pronunciationString = '<' + data[entry].pronunciationlink + '|(Pronunciation)>';
		}
		blockStr.push({
			"type" : "section",
			"fields" : [{
				"type": "mrkdwn",
				"text" : "*Dutch:*\n"+data[entry].dutch+" - "+ pronunciationString
			},
			{
				"type": "mrkdwn",
				"text": "*English:*\n"+data[entry].english
			}]
		});
	}
	return JSON.stringify(blockStr);
}

app.get("/getSlackInfo", (req, res) => {
	res.json({ sendDailySlackBtnLabel: SEND_DAILY_SLACK_BTN_LABEL });
});

app.get("/getReviewCategories", async (req, res) => {
	await pool.connect(async (err, client, release) => {
		if(err) {
			return console.error('Error acquiring client', err.stack)
		}
		client.query("SELECT name FROM category WHERE name != '' ORDER BY category_order ASC", async (err, result) => {
			release();
			if(err) {
				return console.error('Error executing query', err.stack);
			} else {
				let setNames = [];
				for(let row in result.rows) {
					setNames.push(result.rows[row].name);
				}

				res.send(setNames);
			}
		});
	});
});

app.get("/getLessonPeopleNames", async (req, res) => {
	await pool.connect(async (err, client, release) => {
		if(err) {
			return console.error('Error acquiring client', err.stack)
		}
		client.query("SELECT person, TO_CHAR(lesson_date, 'YYYY-MM-DD') as lesson_date, notes, lesson_title FROM lesson", async (err, result) => {
			release();
			if(err) {
				return console.error('Error executing query', err.stack);
			} else {
				const lessons = {};
				for(let row in result.rows) {
					let capitalizedName = result.rows[row].person.charAt(0).toUpperCase() + result.rows[row].person.slice(1);

					if(Object.keys(lessons).includes(capitalizedName)) {
						lessons[capitalizedName].push(result.rows[row]);
					} else {
						lessons[capitalizedName] = [result.rows[row]];
					}
				}

				res.send(lessons);
			}
		});
	});
});

app.post("/sendSlack", async (req, res) => {
	resetVocabRecordsToUnseen(); // TODO: REMOVE AFTER ACTIVE DEV IS DONE
	let body = "";
	req.on('data', chunk => {
		body += chunk.toString();
	});
	req.on('end', () => {
		res.end('ok');
		sendDailyDutchVocabToSlack(JSON.parse(body).recordCount);
	});
});

app.post("/getVocabForCategory", async (req, res) => {
	let body = "";
	req.on('data', chunk => {
		body += chunk.toString();
	});
	req.on('end', async () => {
		let queryStr = "SELECT id, english, dutch, pronunciationLink FROM vocabulary";
		const params = [];
		if(JSON.parse(body).category !== 'Review All') {
			queryStr += " WHERE set_name = $1";
			params.push(JSON.parse(body).category);
		}

		await pool.connect(async (err, client, release) => {
			if(err) {
				return console.error('Error acquiring client', err.stack)
			}
			client.query(queryStr, params, async (err, result) => {
				release();
				if(err) {
					return console.error('Error executing query', err.stack);
				} else {
					res.send(result.rows);
				}
			});
		});
	});
});

app.listen(PORT, () => {
	console.log(`Server listening on ${PORT}`);
});