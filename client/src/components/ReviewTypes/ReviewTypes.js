import { Link } from "react-router-dom";
import * as Constants from "../../constants";

const ReviewTypes = (props) => {
  const PRACTICE_LINK = `?${Constants.SETNAME_QUERY_PARAM}=${props.setName}&${Constants.REVIEWTYPE_QUERY_PARAM}=${Constants.VOCAB_CARD_REVIEWTYPE_PRACTICE_STR}`;
  const TEST_LINK = `?${Constants.SETNAME_QUERY_PARAM}=${props.setName}&${Constants.REVIEWTYPE_QUERY_PARAM}=${Constants.VOCAB_CARD_REVIEWTYPE_TEST_STR}`;

  return (
    <div className="review-type-options">
      <Link
        className="review-type-item"
        to={PRACTICE_LINK}
      >
        {Constants.VOCAB_CARD_REVIEWTYPE_PRACTICE_LABEL}
      </Link>
      <Link
        className="review-type-item"
        to={TEST_LINK}
      >
        {Constants.VOCAB_CARD_REVIEWTYPE_TEST_LABEL}
      </Link>
    </div>
  );
};

export default ReviewTypes;