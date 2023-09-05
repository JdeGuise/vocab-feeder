const path = require('node:path'); 
require('dotenv').config({ path: path.resolve(__dirname, './.env') });

const PORT = process.env.NODE_PORT || 3001;

const { initDailyDutchScheduler } = require("./jobs/vocab.job");
const { slackApp, storage } = require("./configs/slack.config");

const {express, router } = require("./routes/vocab.route");
const app = express();

const { buildLoggingStr } = require("./utils/helper.util");
const { logger } = require("./log"); // this retrieves default logger which was configured in log.js

(async () => {
  await storage.init({ dir: "./src/localStorage" });
  await slackApp.start();

  initDailyDutchScheduler();
})();

slackApp.error((error: any) => {
  logger.info(buildLoggingStr(error));
});

app.use("/api", router);

app.use(express.static(__dirname));
app.use(express.static(path.join(__dirname, './../../dist/client')));

app.get("/*", function(req: any, res: any) {
  res.sendFile(path.resolve(__dirname, './../client', 'index.html'));
});

app.listen(PORT, () => {
  logger.info(buildLoggingStr(`Server listening on ${PORT}`));
  console.log(`Server listening on ${PORT}`);
});

export {};