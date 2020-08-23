import React from "react";
import { Link } from "react-router-dom";

import Menu from "../menu/Menu";

import * as classes from "./Header.module.css";
import logo from "../../static/images/logo.png";

const Header = () => (
	<div className={classes["header"]}>
		<div className={classes["header-content"]}>
			<Menu />
			<Link to="/" className={classes["header-logoContainer"]}>
				<img className={classes["header-image"]} src={logo} alt="" />
				<h1 className={classes["header-brandName"]}>
					inteligencia industrial
				</h1>
			</Link>
		</div>
	</div>
);

export default Header;
