import React from "react";
import Card from "../../card/Card";
import Row from "../../../layout/row/Row";

import * as classes from "./ForumCard.module.css";
import Spacer from "../../../layout/spacer/Spacer";

type PropsType = {
	onClick: () => void;
	forum: any;
};

const ForumCard = (props: PropsType) => {
	return (
		<Card padding={15} onClick={props.onClick}>
			<Row>
				<strong className={classes["forumCard-title"]}>
					{props.forum.title}
				</strong>
			</Row>
			<Spacer vertical={5} />
			<Row>
				<span className={classes["forumCard-info"]}>
					Criado por {props.forum.user} ·{" "}
					{/* {new Date(props.forum.originalPost.date).toLocaleDateString()} */}
				</span>
			</Row>
			<Spacer vertical={5} />
			<Row>
				<span className={classes["forumCard-info"]}>
					Ultima atualização em{" "}
					{/* {new Date(props.forum.originalPost.date).toLocaleDateString()} */}
				</span>
			</Row>
			<Spacer vertical={5} />
			<Row>
				<span className={classes["forumCard-info"]}>
					{props.forum.forumPosts.length} respostas
				</span>
			</Row>
		</Card>
	);
};

export default ForumCard;
