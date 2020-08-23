import React from "react";

import Spacer from "../../layout/spacer/Spacer";

import * as classes from "./Title.module.css";

type PropsType = {
	children: string;
	accessories?: JSX.Element[];
};

const Title = (props: PropsType) => (
	<div className={classes["titleContainer"]}>
		<h1 className={classes["title"]}>{props.children}</h1>
		<Spacer horizontal="flex" />
		{props.accessories?.map((el, index) => ({ ...el, key: index }))}
	</div>
);

export default Title;
