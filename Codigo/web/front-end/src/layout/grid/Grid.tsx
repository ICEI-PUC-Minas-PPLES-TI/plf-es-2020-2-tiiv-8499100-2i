import React from "react";

import * as classes from "./Grid.module.css";

type PropsType = {
	children: any;
};

const Grid = (props: PropsType) => {
	return <div className={classes["grid"]}>{props.children}</div>;
};

export default Grid;
