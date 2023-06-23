const schedule = require("node-schedule");
const { sendDailyDutchVocabToSlack } = require("../services/slack.service");
const { DEFAULT_VOCAB_BATCH_COUNT } = require("./../constants");

const initDailyDutchScheduler = () => {
  schedule.scheduleJob("30 7 * * *", () => {
    sendDailyDutchVocabToSlack(DEFAULT_VOCAB_BATCH_COUNT);
  });
};

export {
  initDailyDutchScheduler,
};
