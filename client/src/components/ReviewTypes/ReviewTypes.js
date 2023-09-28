import { Link } from "react-router-dom";
import * as Constants from "../../constants/constants";

const ReviewTypes = (props) => {
  const BASE_LINK = `?${Constants.SETNAME_QUERY_PARAM}=${props.setName}&${Constants.REVIEWMODE_QUERY_PARAM}=`;

  const PRACTICE_LINK_VOCAB = BASE_LINK + `${Constants.VOCAB_CARD_REVIEW_PRACTICE_STR}&${Constants.REVIEWTYPE_QUERY_PARAM}=${Constants.VOCAB_CARD_REVIEW_VOCAB_STR}`;
  const TEST_LINK_VOCAB = BASE_LINK + `${Constants.VOCAB_CARD_REVIEW_TEST_STR}&${Constants.REVIEWTYPE_QUERY_PARAM}=${Constants.VOCAB_CARD_REVIEW_VOCAB_STR}`;

  const PRACTICE_LINK_DEHET = BASE_LINK + `${Constants.VOCAB_CARD_REVIEW_PRACTICE_STR}&${Constants.REVIEWTYPE_QUERY_PARAM}=${Constants.VOCAB_CARD_REVIEW_DEHET_STR}`;
  const TEST_LINK_VOCAB_DEHET = BASE_LINK + `${Constants.VOCAB_CARD_REVIEW_TEST_STR}&${Constants.REVIEWTYPE_QUERY_PARAM}=${Constants.VOCAB_CARD_REVIEW_DEHET_STR}`;

  return (
    <div className="review-type-options">
      <h1>Vocab Drilling</h1>
      <div className="review-type flex-grid-halves">
        <Link
          className="review-type-item col"
          to={PRACTICE_LINK_VOCAB}
        >
          {Constants.VOCAB_CARD_REVIEW_PRACTICE_LABEL}
        </Link>
        <Link
          className="review-type-item col"
          to={TEST_LINK_VOCAB}
        >
          {Constants.VOCAB_CARD_REVIEW_TEST_LABEL}
        </Link>
      </div>

      <h1>De / Het Drilling</h1>
      <div className="review-type flex-grid-halves">
        <Link
          className="review-type-item col"
          to={PRACTICE_LINK_DEHET}
        >
          {Constants.VOCAB_CARD_REVIEW_PRACTICE_LABEL}
        </Link>
        <Link
          className="review-type-item col"
          to={TEST_LINK_VOCAB_DEHET}
        >
          {Constants.VOCAB_CARD_REVIEW_TEST_LABEL}
        </Link>
      </div>
    </div>
  );
};

export default ReviewTypes;