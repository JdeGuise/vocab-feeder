import React, { useState, useEffect, useCallback } from "react";
import { useSearchParams  } from 'react-router-dom';

import { shuffleArray } from './../../utils.js';
import "./../../App.css";
import CategoryList from "../CategoryList/CategoryList";
import VocabCard from "../VocabCard/VocabCard";

const ReviewVocab = (props) => {
	const SHOW_CARD_SIDE_CSS = 'vocab-card-show-side';
	const HIDE_CARD_SIDE_CSS = 'vocab-card-hide-side';

	const [searchParams] = useSearchParams();
    const [categories, setCategories] = useState([]);
	const [records, setRecords] = useState([]);
    const [isLoaded, setIsLoaded] = useState(false);
    const [frontCSS, setFrontCSS] = useState(SHOW_CARD_SIDE_CSS);
    const [backCSS, setBackCSS] = useState(HIDE_CARD_SIDE_CSS);

	const GetRecordsForCategory = useCallback((e) => {
		setIsLoaded(false);
		fetch('/getVocabForCategory', {
			method: 'POST',
			body: JSON.stringify({
				category: e.target.innerText
			}),
			headers: {
				'Content-type': 'application/json; charset=UTF-8',
			},
		})
		.then((res) => res.json())
		.then((data) => {
			setRecords(shuffleArray(data));
			setIsLoaded(true);
		});
	}, [setRecords]);

	let [i, setI] = useState(0);
	const GetNextCard = () => {
		setFrontCSS(SHOW_CARD_SIDE_CSS);
		setBackCSS(HIDE_CARD_SIDE_CSS);
		
		if(i < records.length-1) {
			setI(++i);
		}
	}

	const GetPrevCard = () => {
		setFrontCSS(SHOW_CARD_SIDE_CSS);
		setBackCSS(HIDE_CARD_SIDE_CSS);

		if(i > 0) {
			setI(--i);
		}
	}

	const FlipCard = () => {
		if(frontCSS === SHOW_CARD_SIDE_CSS) {
			setFrontCSS(HIDE_CARD_SIDE_CSS);
		} else {
			setFrontCSS(SHOW_CARD_SIDE_CSS);
		}

		if(backCSS === SHOW_CARD_SIDE_CSS) {
			setBackCSS(HIDE_CARD_SIDE_CSS);
		} else {
			setBackCSS(SHOW_CARD_SIDE_CSS);
		}
	}

	useEffect(() => {
		fetch("/getReviewCategories")
			.then((res) => res.json())
			.then((data) => {
				setCategories(data);
				setIsLoaded(true);
			}).catch((err) => {
				console.error('Error:', err);
			});
	},[]);

	if(isLoaded) {
		if(searchParams.get("set_name") && records.length > 0) {
			return (
				<VocabCard card={records[i]} GetPrevCard={GetPrevCard} GetNextCard={GetNextCard} FlipCard={FlipCard} frontCSS={frontCSS} backCSS={backCSS}/>
			);
		} else {
			return (
				<CategoryList categories={categories} GetRecordsForCategory={GetRecordsForCategory} />
			);
		}
	}
}

export default ReviewVocab;