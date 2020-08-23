import React from "react";

import * as classes from "./Spinner.module.css";

const Spinner = () => (
	<div className={classes["sk-folding-cube"]}>
		<div className={`${classes["sk-cube1"]} ${classes["sk-cube"]}`} />
		<div className={`${classes["sk-cube2"]} ${classes["sk-cube"]}`} />
		<div className={`${classes["sk-cube4"]} ${classes["sk-cube"]}`} />
		<div className={`${classes["sk-cube3"]} ${classes["sk-cube"]}`} />
	</div>
);

export default Spinner;
