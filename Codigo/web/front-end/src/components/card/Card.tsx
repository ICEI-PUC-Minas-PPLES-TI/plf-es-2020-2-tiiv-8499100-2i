import React from "react";

import * as classes from "./Card.module.css";

type PropsType = {
	children: any;
	width?: number;
	padding?: number;
	onClick?: () => void;
};

const Card = (props: PropsType) => (
	<div
		className={classes["card"]}
		style={{
			width: `${props.width}px`,
			padding: `${props.padding}px`,
			cursor: `${props.onClick ? "pointer" : "auto"}`,
		}}
		onClick={props.onClick}
	>
		{props.children}
	</div>
);

export default Card;
