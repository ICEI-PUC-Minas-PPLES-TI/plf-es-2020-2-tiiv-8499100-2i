import React from "react";

import * as classes from "./NewButton.module.css";

type PropsType = {
	onClick: () => void;
};

const NewButton = (props: PropsType) => (
	<button className={classes["newButton"]} onClick={props.onClick}>
		Novo
	</button>
);

export default NewButton;
