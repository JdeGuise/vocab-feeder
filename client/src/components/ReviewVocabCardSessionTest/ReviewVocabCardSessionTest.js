import * as Constants from "../../constants/constants";

const ReviewVocabCardSessionTest = (props) => {
  return (
    <div className="vocab-card-wrapper">
      <h4 key={props.correctCount}>
        You have gotten {props.correctCount} correct out of {props.totalAttempted}.
      </h4>
      <form onSubmit={props.HandleSubmit} className="slack-form">
        <div className="vocab-card">
          <img
            className="vocab-card-img"
            src={Constants.S3_BUCKET_URL + props.card.id + ".png"}
            alt=""
            onError={(event) => (event.target.src = "image-needed.png")}
            onLoad={(event) => (event.target.style.visibility = "visible")}
          />
          <div className={props.css.frontCSS}>
            <a
              href={props.card.pronunciationlink}
              target="_blank"
              rel="noreferrer"
            >
              <p className="vocab-card-text">{props.card.dutch}</p>
            </a>
          </div>
          <div className={props.css.backCSS}>
            <p className="vocab-card-text">{props.card.english}</p>
          </div>
        </div>
        <div className="vocab-card-input">
          <input
            type="text"
            key={props.isDisabled}
            placeholder={Constants.VOCAB_CARD_ANSWER_PLACEHOLDER}
            onChange={props.HandleAnswerChange}
            value={props.answer}
            required
            disabled={props.isDisabled}
          />
        </div>
        <div className="vocab-card-controls">
          <div className="vocab-card-controls-flip">
            <input
              type="submit"
              key={props.isDisabled}
              className={props.css.buttonCSS}
              placeholder={Constants.VOCAB_CARD_SUBMIT_BUTTON_STR}
              disabled={props.isDisabled}
            ></input>
          </div>
          <br className="vocab-card-controls-spacer" />
          <div className="vocab-card-controls-nav">
            <button onClick={props.GetPrevCard} className={props.css.prevCSS}>
              {Constants.VOCAB_CARD_PREV_BUTTON_STR}
            </button>
            <button onClick={props.GetNextCard} className={props.css.nextCSS}>
              {Constants.VOCAB_CARD_NEXT_BUTTON_STR}
            </button>
          </div>
        </div>
      </form>
      <div id="snackbar" className={props.css.snackbarCSS}></div>
    </div>
  );
}

export default ReviewVocabCardSessionTest;