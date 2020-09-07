import React from "react";
import Card from "../../card/Card";
import Row from "../../../layout/row/Row";
import Column from "../../../layout/column/Column";
import Button from "../../button/Button";
import Spacer from "../../../layout/spacer/Spacer";

import * as classes from "./ForumPostCard.module.css";

const ForumPostCard = () => {
	return (
		<Card padding={15}>
			<Row justify="space-between">
				<Column>
					<strong className={classes["forumPostCard-title"]}>
						Dúvida sobre GD&T
					</strong>
					<Spacer vertical={10} />
					<span className={classes["forumPostCard-author"]}>
						Por: Lucas A. Gusmão
					</span>
				</Column>
				<Button size="small" label="Excluir" buttonAttrs={{}} />
			</Row>
			<Spacer vertical={20} />
			<Row>
				Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ipsa
				doloremque tempore iure atque culpa officia? Quia, aperiam! Ratione,
				eum! Deserunt dicta ex natus qui voluptates velit cumque ipsam, expedita
				consequuntur!
			</Row>
			<Spacer vertical={20} />
			<Row>
				<span className={classes["forumPostCard-date"]}>
					Postado em 02/09/2020
				</span>
			</Row>
		</Card>
	);
};

export default ForumPostCard;
