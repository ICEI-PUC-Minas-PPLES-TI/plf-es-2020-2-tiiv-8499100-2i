import React from "react";

import * as classes from "./Body.module.css";

type PropsType = {
	children: any;
};

const Body = (props: PropsType) => (
	<div className={classes["body"]}>{props.children}</div>
);

export default Body;
