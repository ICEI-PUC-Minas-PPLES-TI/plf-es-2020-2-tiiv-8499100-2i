import React from "react";

import * as classes from "./TextField.module.css";

type PropsType = {
	label: string;
	inputAttrs: React.InputHTMLAttributes<HTMLInputElement>;
};

const TextField = (props: PropsType) => {
	return (
		<div className={classes["textField"]}>
			<label
				className={classes["textField-label"]}
				htmlFor={props.inputAttrs.id}
			>
				{props.label}
			</label>
			<input
				className={classes["textField-input"]}
				type="text"
				{...props.inputAttrs}
			/>
		</div>
	);
};

export default TextField;
