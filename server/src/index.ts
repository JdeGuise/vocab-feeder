require("dotenv").config();

const PORT = process.env.NODE_PORT || 3001;

const { initDailyDutchScheduler } = require("./jobs/vocab.job");
const { slackApp, storage } = require("./configs/slack.config");

const {express, router } = require("./routes/vocab.route");
const app = express();

const { buildLoggingString } = require("./utils/helper.util");
const { logger } = require("./log"); // this retrieves default logger which was configured in log.js

(async () => {
  await storage.init({ dir: "/home/pi/vocab-feeder/server/src/localStorage" });
  await slackApp.start();

  initDailyDutchScheduler();
})();

slackApp.error((error: any) => {
  logger.info(buildLoggingString(error));
});

app.use("/api", router);

app.listen(PORT, () => {
  logger.info(buildLoggingString(`Server listening on ${PORT}`));
  console.log(`Server listening on ${PORT}`);
});

export {};