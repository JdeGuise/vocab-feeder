import React from "react";
import { BrowserRouter, Route, Routes, Link } from 'react-router-dom';

import "./App.css";
import * as Constants from "./constants";

class App extends React.Component {
	constructor(props) {
		super(props);
		this.state = {data: ''};
	}

	render() {
		return (
			<div className="App">
				<BrowserRouter>
					<header className="App-header">
						<div>
							<span>{Constants.APP_HEADER_TITLE}</span>
							<nav>
								<ul>
									{Constants.ROUTES.map((link) =>
										<li key={link}>
											<Link to={link.route} className="navAnchor">{link.linkLabel}</Link>
										</li>
									)}
								</ul>
							</nav>
						</div>
					</header>
					<Routes>
						{Constants.ROUTES.map((route) =>
							<Route exact path={route.route} element={route.element}/>
						)}
					</Routes>
				</BrowserRouter>
			</div>
		);
	}
}

export default App;