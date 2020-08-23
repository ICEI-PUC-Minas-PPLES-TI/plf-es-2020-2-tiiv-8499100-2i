import React from "react";
import TextareaAutosize from "react-textarea-autosize";

import * as classes from "./TextArea.module.css";

type PropsType = {
	label: string;
	inputAttrs: React.TextareaHTMLAttributes<HTMLTextAreaElement>;
};

const TextArea = (props: PropsType) => {
	return (
		<div className={classes["textArea"]}>
			<label
				className={classes["textArea-label"]}
				htmlFor={props.inputAttrs.id}
			>
				{props.label}
			</label>
			<TextareaAutosize
				className={classes["textArea-input"]}
				{...props.inputAttrs}
			/>
		</div>
	);
};

export default TextArea;
