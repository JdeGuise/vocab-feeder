const buildKeyString = (resultRows: any) => {
  let keyString = "";
  for (const row in resultRows) {
    if (resultRows[row].id) {
      keyString += resultRows[row].id;
    }
  }

  return keyString;
};

const buildLoggingString = (message: any, opts: any) => {
  if (opts) {
    if (opts.payload) {
      return `${message} : ${opts.payload}`;
    }
  }

  return `${message}`;
};

export {
  buildKeyString,
  buildLoggingString,
};
