import { Link } from "react-router-dom";

import "./../../VocabFeederApp.css";
import * as Constants from "../../constants/constants";

const ReviewCategoryList = (props) => {
  return (
    <div className="ReviewApp">
      <h1>{Constants.CHOOSE_CATEGORY_LABEL}</h1>
      <ul>
        <li>
          <Link
            className="category-list-item"
            to={Constants.REVIEW_ENDPOINT_SETNAME_PARAM + "all"}
            onClick={props.GetRecordsForCategory}
          >
            {Constants.REVIEW_ALL_CATEGORY_LABEL}
          </Link>
        </li>
        <hr />
        <div className="category-list-item-specific">
          {props.categories.map((category) => (
            <CategoryOption
              category={category}
              GetRecordsForCategory={props.GetRecordsForCategory}
              HandleMarkAsStudied={props.HandleMarkAsStudied}
            />
          ))}
        </div>
      </ul>
    </div>
  );
};

const CategoryOption = (props) => {
  let styledLi = props.category.fully_studied ? (
    <s>{props.category.name}</s>
  ) : (
    props.category.name
  );

  return (
    <li key={props} className="category-option-list-item">
      <div
        key={props.category.name}
        className="category-option-list-item-contents"
      >
        <div
          key={props.category.fully_studied}
          className="category-option-list-item-checkbox"
        >
          <input
            onClick={props.HandleMarkAsStudied}
            type="checkbox"
            defaultChecked={props.category.fully_studied}
            key={props.category.name}
            data-key={props.category.id}
          ></input>
        </div>
        <div
          key={props.category.name}
          className="category-option-list-item-value"
        >
          <Link
            className="category-list-item"
            to={Constants.REVIEW_ENDPOINT_SETNAME_PARAM + props.category.name}
            onClick={props.GetRecordsForCategory}
          >
            {styledLi}
          </Link>
        </div>
      </div>
      <hr className="no-margin" />
    </li>
  );
};

export default ReviewCategoryList;
