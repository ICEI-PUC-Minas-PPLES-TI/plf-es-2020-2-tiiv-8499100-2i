import React from "react";

import * as classes from "./Column.module.css";

type PropsType = {
	children: any;
	align?: string;
};

const Column = (props: PropsType) => (
	<div className={classes["column"]} style={{ alignItems: props.align }}>
		{props.children}
	</div>
);

export default Column;
