import React, { useState } from "react";
import { useSearchParams } from "react-router-dom";
import "./../../Snackbar.css";

import "./ReviewVocabCardSession.css";
import * as Constants from "../../constants/constants";

import ReviewVocabCardSessionPractice from "../ReviewVocabCardSessionPractice/ReviewVocabCardSessionPractice.js";
import ReviewVocabCardSessionTest from "../ReviewVocabCardSessionTest/ReviewVocabCardSessionTest.js";

const ReviewVocabCardSession = (props) => {
  const [searchParams] = useSearchParams();
  const [isLoaded, setIsLoaded] = useState(false);

  if (
    !isLoaded &&
    searchParams.get(Constants.REVIEWTYPE_QUERY_PARAM) ===
      Constants.VOCAB_CARD_REVIEWTYPE_TEST_STR
  ) {
    props.setCSS({
      ...props.css,
      nextCSS: Constants.HIDE_NEXT_BTN_CSS,
    });

    setIsLoaded(true);
  }

  const HandleSubmit = (e) => {
    e.preventDefault();

    props.setIsDisabled(true);
    props.setCSS({
      ...props.css,
      buttonCSS: Constants.VOCAB_CARD_DISABLED_BUTTON_CSS,
      frontCSS: Constants.HIDE_CARD_SIDE_CSS,
      backCSS: Constants.SHOW_CARD_SIDE_CSS,
      nextCSS: null,
    });
    props.setTotalAttempted(props.totalAttempted + 1);

    if (props.card.english.toLowerCase().includes(props.answer.toLowerCase())) {
      props.setCorrectCount(props.correctCount + 1);
      props.showSnackbar(true);
    } else {
      props.showSnackbar(false);
    }
  };

  const HandleAnswerChange = (e) => {
    e.preventDefault();
    props.setAnswer(e.target.value);
  };

  const REVIEW_TYPE = searchParams.get(Constants.REVIEWTYPE_QUERY_PARAM);

  if(REVIEW_TYPE === Constants.VOCAB_CARD_REVIEWTYPE_PRACTICE_STR) {
    return (
      <ReviewVocabCardSessionPractice 
        card={props.card} 
        css={props.css} 
        FlipCard={props.FlipCard} 
        GetNextCard={props.GetNextCard} 
        GetPrevCard={props.GetPrevCard} 
      />
    );
  } else if(REVIEW_TYPE === Constants.VOCAB_CARD_REVIEWTYPE_TEST_STR) {
    return (
      <ReviewVocabCardSessionTest
        correctCount={props.correctCount}
        totalAttempted={props.totalAttempted}
        card={props.card}
        css={props.css}
        isDisabled={props.isDisabled}
        answer={props.answer}
        GetPrevCard={props.GetPrevCard} 
        GetNextCard={props.GetNextCard} 
        HandleSubmit={HandleSubmit} 
        HandleAnswerChange={HandleAnswerChange}
      />
    );
  }
};

export default ReviewVocabCardSession;