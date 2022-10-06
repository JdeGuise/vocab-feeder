require('dotenv').config();
const schedule = require('node-schedule');
const { Pool } = require('pg');
const { WebClient } = require('@slack/web-api');
const { App } = require('@slack/bolt');
const web = new WebClient(process.env.SLACK_BOT_TOKEN);
const EXPECTED_VOCAB_BATCH_COUNT = 3;

const app = new App({
	token: process.env.SLACK_BOT_TOKEN,
	signingSecret: process.env.SLACK_SIGNING_SECRET,
	socketMode: true,
	appToken: process.env.SLACK_APP_TOKEN,
	port: process.env.PORT || 3000
});

const pool = new Pool({
	host: 'localhost',
	user: process.env.POSTGRES_USERNAME,
	password: process.env.POSTGRES_PASSWORD,
	database: 'vocabdb',
	max: 20,
	idleTimeoutMillis: 30000,
	connectionTimeoutMillis: 2000,
});

function updateVocabMasteredVal(vocabId, isMastered) {
	pool.connect((err, client, release) => {
		if(err) {
			return console.error('Error acquiring client', err.stack)
		}
		client.query('UPDATE vocabulary SET mastered = $1 WHERE id = $2', [isMastered, vocabId], (err, result) => {
			release();
			if(err) {
				return console.error('Error executing query', err.stack);
			} else {
				console.log('Mastered value set successfully.');
			}
		});
	});
}

async function setupVocabMsgEventListeners(results) {
	for(let i = 0; i < results.length; i++) {
		app.action(results[i].id.toString(), function(e) {
			updateVocabMasteredVal(results[i].id.toString(), e.action.selected_options.length > 0);
		});
	}
	sendDailyDutchVocabToSlack(results);
}

async function getDailyDutchVocab() {
	pool.connect((err, client, release) => {
		if(err) {
			return console.error('Error acquiring client', err.stack)
		}
		client.query('SELECT id, dutch, english, pronunciationLink FROM vocabulary WHERE seen != TRUE AND mastered != TRUE ORDER BY random() LIMIT $1', [EXPECTED_VOCAB_BATCH_COUNT], (err, result) => {
			release();
			if(err) {
				return console.error('Error executing query', err.stack);
			} else {
				setupVocabMsgEventListeners(result.rows);
			}
		});
	});
}

(async () => {
	await getDailyDutchVocab();
	// Start your app
	await app.start();
  
	console.log('⚡️ Bolt app is running!');
})();

schedule.scheduleJob('30 07 * * *', function(){
	(async () => {
		await getDailyDutchVocab();
		// Start your app
		await app.start();
	  
		console.log('⚡️ Bolt app is running!');
	})();
});

function sendDailyDutchVocabToSlack(rows) {
	if(rows.length > 0) {
		postSlackMessage(rows);
		// updateVocabRecordsAsSeen(rows);
	}
}

function updateVocabRecordsAsSeen(data) {
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
		await web.chat.postMessage({
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
		blockStr.push({
			"type" : "section",
			"fields" : [{
				"type": "mrkdwn",
				"text" : "*Dutch:*\n"+data[entry].dutch+" <"+data[entry].pronunciationlink+"|(Pronunciation)>"
			},
			{
				"type": "mrkdwn",
				"text": "*English:*\n"+data[entry].english
			}]
		});
		blockStr.push({
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": "*Mastered*"
			},
			"accessory": {
				"type": "checkboxes",
				"action_id": data[entry].id.toString(),
				"options": [
					{
						"value": "TRUE",
						"text": {
							"type": "mrkdwn",
							"text": " "
						}
					}
				]
			}
		});
	}
	return JSON.stringify(blockStr);
}