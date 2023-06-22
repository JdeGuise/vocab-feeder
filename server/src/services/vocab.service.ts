const pool = require("../configs/pool.config");
const format = require("pg-format");
const {
  SEND_DAILY_SLACK_BTN_LABEL,
  QUERY_CONNECTION_ERROR_MSG,
  QUERY_EXECUTION_ERROR_MSG,
} = require("../../constants");

const { buildLoggingStr } = require("../utils/helper.util");
const { logger } = require("../../log"); // this retrieves default logger which was configured in log.js

const getConnection = (callback: any) => {
  pool.getConnection((err: any, connection: any, release: any) => {
    callback(err, connection, release);
  });
};

const getSlackInfo = async (req: any, res: any, next: any) => {
  try {
    return { sendDailySlackBtnLabel: SEND_DAILY_SLACK_BTN_LABEL };
  } catch (err: any) {
    logger.error(buildLoggingStr("Error: ", err.message));
    console.error("Error: ", err.message);
    next(err);
  }
};

// const getReviewCategories = async (req: any, res: any, next: any) => {
const getReviewCategories = async (req: any, res: { send: (arg0: any[]) => void; }, next: any) => {
  await pool.connect(async (err: any, client: any, release: any) => {
    if (err) {
      logger.error(buildLoggingStr(QUERY_CONNECTION_ERROR_MSG, err.stack));
      return console.error(QUERY_CONNECTION_ERROR_MSG, err.stack);
    }
    client.query(
      "SELECT name FROM category WHERE name != '' ORDER BY category_order ASC",
      async (err: any, result: any) => {
        release();
        if (err) {
          logger.error(buildLoggingStr(QUERY_EXECUTION_ERROR_MSG, err.stack));
          return console.error(QUERY_EXECUTION_ERROR_MSG, err.stack);
        }
        const setNames = [];
        for (const row in result.rows) {
          setNames.push(result.rows[row].name);
        }

        res.send(setNames);
      }
    );
  });
};

const buildInsertVocabRecordQuery = (newVocab: { [s: string]: unknown; } | ArrayLike<unknown>) => {
  return format(
    "INSERT INTO vocabulary (%I) VALUES (%L)",
    Object.keys(newVocab),
    Object.values(newVocab)
  );
};

const buildUpdateVocabRecordByIdQuery = (id: string, cols: { [x: string]: any; }) => {
  const query = ["UPDATE vocabulary"];
  query.push("SET");

  // Create another array storing each set command
  // and assigning a number value for parameterized query
  const set: string[] = [];
  Object.keys(cols).forEach((key, i) => {
    set.push(`${cols[key]} = ($${i + 1})`);
  });
  query.push(set.join(", "));

  // Add the WHERE statement to look up by id
  query.push(`WHERE id = ${id}`);

  // Return a complete query string
  return query.join(" ");
};

const buildDeleteVocabRecordByIdQuery = (id: string) => {
  return format("DELETE FROM vocabulary WHERE id = %L", id);
};

export {
  getSlackInfo,
  getConnection,
  getReviewCategories,
  buildUpdateVocabRecordByIdQuery,
  buildInsertVocabRecordQuery,
  buildDeleteVocabRecordByIdQuery,
};
