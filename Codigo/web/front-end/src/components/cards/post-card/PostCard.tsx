import React from "react";

import { PostType } from "../../../types/post";

import Row from "../../../layout/row/Row";
import Button from "../../button/Button";
import Spacer from "../../../layout/spacer/Spacer";

import * as classes from "./PostCard.module.css";
import Card from "../../card/Card";

type PropsType = {
	post: PostType;
	editPost: (postId: number) => void;
	deletePost: (postId: number) => void;
};

const PostCard = (props: PropsType) => (
	<Card padding={0}>
		<div className={classes["postCard-imageContainer"]}>
			<img src={props.post.img} alt="" className={classes["postCard-image"]} />
		</div>
		<div className={classes["postCard-body"]}>
			<strong className={classes["postCard-title"]}>{props.post.title}</strong>
			<Row>
				<Button
					label="editar"
					size="small"
					buttonAttrs={{
						onClick: () => props.editPost(props.post.id),
					}}
				/>
				<Spacer horizontal="flex" />
				<Button
					label="excluir"
					size="small"
					buttonAttrs={{
						onClick: () => props.deletePost(props.post.id),
					}}
				/>
			</Row>
		</div>
	</Card>
);

export default PostCard;
