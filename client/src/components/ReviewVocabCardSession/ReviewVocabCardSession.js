import { useState } from "react";
import { useSearchParams } from "react-router-dom";

import * as Constants from "../../constants/constants";
import "./../../Snackbar.css";
import "./ReviewVocabCardSession.css";

import ReviewVocabCardSessionPractice from "../ReviewVocabCardSessionPractice/ReviewVocabCardSessionPractice.js";
import ReviewVocabCardSessionTest from "../ReviewVocabCardSessionTest/ReviewVocabCardSessionTest.js";

const ReviewVocabCardSession = (props) => {
  const [searchParams] = useSearchParams();
  const [isLoaded, setIsLoaded] = useState(false);
  let [i, setI] = useState(0);
  const [isDisabled, setIsDisabled] = useState(false);
  const [answer, setAnswer] = useState("");
  const [showSummary, setShowSummary] = useState(false);

  const REVIEW_TYPE = searchParams.get(Constants.REVIEWMODE_QUERY_PARAM);

  const [css, setCSS] = useState({
    frontCSS: Constants.SHOW_CARD_SIDE_CSS,
    backCSS: Constants.HIDE_CARD_SIDE_CSS,
    prevCSS: Constants.HIDE_PREV_BTN_CSS,
    buttonCSS: Constants.VOCAB_CARD_ORIGINAL_BUTTON_CSS,
  });

  const FlipCard = () => {
    setCSS((css) => ({
      ...css,
      frontCSS:
        css.frontCSS === Constants.HIDE_CARD_SIDE_CSS
          ? Constants.SHOW_CARD_SIDE_CSS
          : Constants.HIDE_CARD_SIDE_CSS,
      backCSS:
        css.backCSS === Constants.HIDE_CARD_SIDE_CSS
          ? Constants.SHOW_CARD_SIDE_CSS
          : Constants.HIDE_CARD_SIDE_CSS,
    }));
  };

  const ShowSnackbar = (isCorrect) => {
    let snackBar = document.getElementById("snackbar");
    setCSS((css) => ({
      ...css,
      snackbarCSS: (isCorrect ? Constants.VOCAB_CARD_CORRECT_CSS : Constants.VOCAB_CARD_INCORRECT_CSS)
    }));

    snackBar.innerText = isCorrect ? 
      Constants.VOCAB_CARD_CORRECT_ANSWER_MSG : 
      Constants.VOCAB_CARD_INCORRECT_ANSWER_MSG;

    setTimeout(function () {
      ResetSnackbar();
    }, 5000);
  };

  const ResetSnackbar = () => {
    setCSS((css) => ({
      ...css,
      snackbarCSS: null
    }));
  };

  const GetNextCard = (e) => {
    e.preventDefault();

    if(REVIEW_TYPE === Constants.VOCAB_CARD_REVIEW_TEST_STR) {
      if(props.totalAttempted === props.cards.length) {
        setShowSummary(true);
      } else {
        // don't reset prevCSS button styles for testing use case (because we never want the button)
        setCSS((css) => ({
          ...css,
          frontCSS: Constants.SHOW_CARD_SIDE_CSS,
          backCSS: Constants.HIDE_CARD_SIDE_CSS,
          nextCSS: Constants.HIDE_NEXT_BTN_CSS,
          buttonCSS: Constants.VOCAB_CARD_ORIGINAL_BUTTON_CSS,
        }));

        ResetSnackbar();
        setAnswer("");
        setIsDisabled(false);
      }
    } else {
      const nextStyle =
        i === props.cards.length - 2 ? Constants.HIDE_NEXT_BTN_CSS : null;

      setCSS((css) => ({
        ...css,
        frontCSS: Constants.SHOW_CARD_SIDE_CSS,
        backCSS: Constants.HIDE_CARD_SIDE_CSS,
        nextCSS: nextStyle,
        prevCSS: null,
      }));
    }

    // check if we still have a next card to go to
    if (i < props.cards.length - 1) {
      setI(++i);
    }
  };

  const GetPrevCard = () => {
    const prevStyle = i === 1 ? Constants.HIDE_PREV_BTN_CSS : null;

    setCSS((css) => ({
      ...css,
      frontCSS: Constants.SHOW_CARD_SIDE_CSS,
      backCSS: Constants.HIDE_CARD_SIDE_CSS,
      nextCSS: null,
      prevCSS: prevStyle,
    }));

    // check if we still have a previous card to go to
    if (i > 0) {
      setI(--i);
    }
  };

  if(!isLoaded && REVIEW_TYPE === Constants.VOCAB_CARD_REVIEW_TEST_STR) {
    setCSS({
      ...css,
      nextCSS: Constants.HIDE_NEXT_BTN_CSS,
    });

    setIsLoaded(true);
  }

  const HandleSubmit = (e) => {
    e.preventDefault();

    setIsDisabled(true);
    setCSS({
      ...css,
      buttonCSS: Constants.VOCAB_CARD_DISABLED_BUTTON_CSS,
      frontCSS: Constants.HIDE_CARD_SIDE_CSS,
      backCSS: Constants.SHOW_CARD_SIDE_CSS,
      nextCSS: null,
    });
    props.setTotalAttempted(props.totalAttempted + 1);

    // TODO: make better check
    if(props.cards[i].english.toLowerCase().includes(answer.toLowerCase())) {
      props.setCorrectCount(props.correctCount + 1);
      ShowSnackbar(true);
    } else {
      ShowSnackbar(false);
    }
  };

  const HandleAnswerChange = (e) => {
    e.preventDefault();
    setAnswer(e.target.value);
  };

  if(REVIEW_TYPE === Constants.VOCAB_CARD_REVIEW_PRACTICE_STR) {
    return (
      <ReviewVocabCardSessionPractice 
        card={props.cards[i]} 
        css={css} 
        FlipCard={FlipCard} 
        GetNextCard={GetNextCard} 
        GetPrevCard={GetPrevCard} 
      />
    );
  } else if(REVIEW_TYPE === Constants.VOCAB_CARD_REVIEW_TEST_STR) {
    return (
      <ReviewVocabCardSessionTest
        correctCount={props.correctCount}
        totalAttempted={props.totalAttempted}
        card={props.cards[i]}
        css={css}
        isDisabled={isDisabled}
        answer={answer}
        showSummary={showSummary}
        GetPrevCard={GetPrevCard} 
        GetNextCard={GetNextCard} 
        HandleSubmit={HandleSubmit} 
        HandleAnswerChange={HandleAnswerChange}
      />
    );
  }
};

export default ReviewVocabCardSession;