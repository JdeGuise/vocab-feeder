import React, { useState, useEffect } from "react";

import "./../../App.css";
import "./../../Snackbar.css";

import * as Constants from "../../constants/constants";
import VocabDeck from "../VocabDeck/VocabDeck";

const VocabDeckWrapper = (props) => {
  const [vocabRecords, setVocabRecords] = useState([]);
  const [refetch, setRefetch] = useState(false);

  const getVocabRecords = () => {
    fetch(Constants.VOCAB_RECORDS_ENDPOINT)
      .then((res) => res.json())
      .then((records) => {
        setVocabRecords(records);
      })
      .catch((err) => {
        console.error(Constants.ERROR_STR, err);
      });
  };

  useEffect(() => {
    getVocabRecords();
  }, [refetch]);

  // update vocabRecords on page after add
  const onCreateVocab = () => {
    setRefetch((prevState) => !prevState);
  };

  // update vocabRecords on page after edit
  const onUpdateVocab = (updatedVocab) => {
    const updatedVocabs = vocabRecords.map((vocab) => {
      if (vocab.id === updatedVocab.id) {
        return updatedVocab;
      } else {
        return vocab;
      }
    });
    setVocabRecords(updatedVocabs);
  };

  return (
    <VocabDeck
      data={vocabRecords}
      LIMIT="10"
      onCreateVocab={onCreateVocab}
      onUpdateVocab={onUpdateVocab}
      setRefetch={setRefetch}
    />
  );
};

export default VocabDeckWrapper;