import React from "react";

import * as classes from "./DeleteButton.module.css";

type PropsType = {
	onClick: () => void;
};

const DeleteButton = (props: PropsType) => (
	<button className={classes["deleteButton"]} onClick={props.onClick}>
		Excluir
	</button>
);

export default DeleteButton;
