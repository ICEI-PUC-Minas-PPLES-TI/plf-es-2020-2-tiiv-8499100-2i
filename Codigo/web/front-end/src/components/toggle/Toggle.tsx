import React, { ChangeEvent } from "react";

import * as classes from "./Toggle.module.css";

type PropsType = {
	label: string;
	value?: boolean;
	onChange?: Function;
	inputAttrs: React.InputHTMLAttributes<HTMLInputElement>;
};

const Toggle = (props: PropsType) => {
	const onChange = (event: ChangeEvent<HTMLInputElement>) => {
		const checked = event.target.checked;
		const fixedEvent = {
			...event,
			target: {
				...event.target,
				id: event.target.id,
				value: checked,
			},
		};

		props.onChange?.(fixedEvent);
	};

	return (
		<div className={classes["toggle"]}>
			<input
				className={classes["toggle-input"]}
				{...props.inputAttrs}
				type="checkbox"
				onChange={onChange}
			/>
			<label
				className={classes["toggle-label"]}
				htmlFor={props.inputAttrs.id}
			>
				<div
					className={`${classes["toggle-icon"]} ${
						props.value ? classes["-checked"] : ""
					}`}
				>
					<i className={classes["toggle-icon-background"]} />
					<i className={classes["toggle-icon-handle"]} />
				</div>
				<span>{props.label}</span>
			</label>
		</div>
	);
};

export default Toggle;
