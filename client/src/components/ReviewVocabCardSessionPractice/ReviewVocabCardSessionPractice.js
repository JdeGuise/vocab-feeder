import * as Constants from "../../constants/constants";

const ReviewVocabCardSessionPractice = (props) => {
  return (
    <div className="vocab-card-wrapper">
      <div className="vocab-card">
        <img
          className="vocab-card-img"
          src={Constants.S3_BUCKET_URL + props.card.id + ".png"}
          alt=""
          onError={(event) => (event.target.src = Constants.VOCAB_CARD_IMAGE_NEEDED_NAME)}
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
      <div className="vocab-card-controls">
        <div className="vocab-card-controls-flip">
          <button onClick={props.FlipCard} className={props.css.buttonCSS}>
            {Constants.VOCAB_CARD_FLIP_BUTTON_STR}
          </button>
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
    </div>
  );
};

export default ReviewVocabCardSessionPractice;