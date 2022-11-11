import React, { useState, useEffect, useCallback } from "react";
import { useSearchParams  } from 'react-router-dom';

import { shuffleArray } from './../../utils.js';
import "./../../App.css";
import CategoryList from "../CategoryList/CategoryList";
import VocabCard from "../VocabCard/VocabCard";

const ReviewVocab = (props) => {
	const [searchParams] = useSearchParams();
    const [categories, setCategories] = useState([]);
	const [records, setRecords] = useState([]);
    const [isLoaded, setIsLoaded] = useState(false);
    const [frontCSS, setFrontCSS] = useState("show-card");
    const [backCSS, setBackCSS] = useState("hide-card");

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
		setFrontCSS('show-card');
		setBackCSS('hide-card');
		
		if(i < records.length-1) {
			setI(++i);
		}
	}

	const GetPrevCard = () => {
		setFrontCSS('show-card');
		setBackCSS('hide-card');

		if(i > 0) {
			setI(--i);
		}
	}

	const FlipCard = () => {
		console.log('flipping');
		if(frontCSS === 'show-card') {
			setFrontCSS('hide-card');
		} else {
			setFrontCSS('show-card');
		}

		if(backCSS === 'show-card') {
			setBackCSS('hide-card');
		} else {
			setBackCSS('show-card');
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
		if(searchParams.get("set_name")) {
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