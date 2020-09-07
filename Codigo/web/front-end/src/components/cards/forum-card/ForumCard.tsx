import React from "react";
import Card from "../../card/Card";
import Row from "../../../layout/row/Row";

import * as classes from "./ForumCard.module.css";
import Spacer from "../../../layout/spacer/Spacer";

type PropsType = any;

const ForumCard = (props: PropsType) => {
	return (
		<Card padding={15} onClick={props.onClick}>
			<Row>
				<strong className={classes["forumCard-title"]}>
					Dúvidas sobre GD&T
				</strong>
			</Row>
			<Spacer vertical={5} />
			<Row>
				<span className={classes["forumCard-info"]}>
					Criado por Lucas Gusmão · 01/09/2020
				</span>
			</Row>
			<Spacer vertical={5} />
			<Row>
				<span className={classes["forumCard-info"]}>
					Ultima atualização em 02/09/2020
				</span>
			</Row>
			<Spacer vertical={5} />
			<Row>
				<span className={classes["forumCard-info"]}>8 respostas</span>
			</Row>
		</Card>
	);
};

export default ForumCard;
