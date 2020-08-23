import React from "react";

import * as classes from "./Button.module.css";

type PropsType = {
	label: string;
	size: "small" | "big";
	buttonAttrs: React.ButtonHTMLAttributes<HTMLButtonElement>;
};

const Button = (props: PropsType) => {
	return (
		<div>
			<button
				className={`${classes["button"]} ${classes["-" + props.size]}`}
				{...props.buttonAttrs}
			>
				{props.label}
			</button>
		</div>
	);
};

export default Button;
