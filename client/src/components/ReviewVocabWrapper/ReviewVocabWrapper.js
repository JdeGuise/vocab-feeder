import { useState, useEffect, useCallback } from "react";
import { useSearchParams } from "react-router-dom";

import { shuffleArray } from "../../utils.js";
import "./../../VocabFeederApp.css";
import * as Constants from "../../constants/constants.js";

import CategoryList from "../CategoryList/CategoryList.js";
import ReviewVocabCardSession from "../ReviewVocabCardSession/ReviewVocabCardSession.js";
import ReviewTypes from "../ReviewTypes/ReviewTypes.js";

const ReviewVocabWrapper = (props) => {
  const [searchParams] = useSearchParams();
  const [categories, setCategories] = useState([]);
  const [records, setRecords] = useState([]);
  const [isLoaded, setIsLoaded] = useState(false);
  const [correctCount, setCorrectCount] = useState(0);
  const [totalAttempted, setTotalAttempted] = useState(0);
  const [categoryTotal, setCategoryTotal] = useState(0);

  const resetState = () => {
    setCorrectCount(0);
    setTotalAttempted(0);
  };

  const GetRecordsForCategory = useCallback(
    (e) => {
      setIsLoaded(false);
      fetch(Constants.GET_VOCAB_FOR_CATEGORY_ENDPOINT, {
        method: Constants.POST_METHOD,
        body: JSON.stringify({
          category: e.target.innerText,
        }),
        headers: {
          "Content-type": Constants.CONTENT_TYPE_JSON_UTF8,
        },
      })
        .then((res) => res.json())
        .then((data) => {
          resetState();
          setCategoryTotal(data.length);
          setRecords(shuffleArray(data));
          setIsLoaded(true);
        });
    },
    [setRecords]
  );

  const HandleMarkAsStudied = (event) => {
    let recordId;
    let isStudied = false;

    const updatedCategories = categories.map((category) => {
      if (String(category.id) === event.target.dataset.key) {
        recordId = category.id;
        isStudied = !category.fully_studied;

        return {
          ...category,
          fully_studied: !category.fully_studied,
        };
      } else {
        return category;
      }
    });

    setCategories(updatedCategories);
    updateCategoryStudiedStatus(recordId, isStudied);
  };

  const updateCategoryStudiedStatus = useCallback(
    (recordId, isStudied) => {
      fetch(Constants.REVIEW_CATEGORIES_ENDPOINT, {
        method: Constants.PATCH_METHOD,
        body: JSON.stringify({
          recordId: recordId,
          isStudied: isStudied,
        }),
        headers: {
          "Content-type": Constants.CONTENT_TYPE_JSON_UTF8,
        },
      })
        .then((res) => res.json())
        .then((data) => {
          resetState();
          setIsLoaded(true);
        });
    },
    []
  );

  useEffect(() => {
    fetch(Constants.REVIEW_CATEGORIES_ENDPOINT)
      .then((res) => res.json())
      .then((data) => {
        setCategories(data);
        setIsLoaded(true);
      })
      .catch((err) => {
        console.error(Constants.ERROR_STR, err);
      });
  }, []);

  if (isLoaded) {
    if (searchParams.get(Constants.SETNAME_QUERY_PARAM) && records.length > 0) {
      if (!searchParams.get(Constants.REVIEWTYPE_QUERY_PARAM)) {
        return (
          <ReviewTypes
            setName={searchParams.get(Constants.SETNAME_QUERY_PARAM)}
          />
        );
      } else {
        return (
          <div className="VocabApp">
            <h1>Category: {searchParams.get(Constants.SETNAME_QUERY_PARAM)}</h1>
            <h3 className="category-card-total">{categoryTotal} cards</h3>
            <ReviewVocabCardSession
              cards={records}
              correctCount={correctCount}
              totalAttempted={totalAttempted}
              setCorrectCount={setCorrectCount}
              setTotalAttempted={setTotalAttempted}
            />
          </div>
        );
      }
    } else {
      return (
        <CategoryList
          categories={categories}
          GetRecordsForCategory={GetRecordsForCategory}
          HandleMarkAsStudied={HandleMarkAsStudied}
        />
      );
    }
  }
};

export default ReviewVocabWrapper;