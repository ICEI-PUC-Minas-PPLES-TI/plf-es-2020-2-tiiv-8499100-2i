import React from "react";

import * as classes from "./Row.module.css";

type PropsType = {
	align?: string;
	children: any;
};

const Row = (props: PropsType) => (
	<div
		className={classes["row"]}
		style={{
			alignItems: props.align,
		}}
	>
		{props.children}
	</div>
);

export default Row;
