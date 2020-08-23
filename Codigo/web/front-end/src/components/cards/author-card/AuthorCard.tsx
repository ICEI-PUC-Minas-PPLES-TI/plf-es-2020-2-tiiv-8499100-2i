import React from "react";

import { AuthorType } from "../../../types/author";

import Card from "../../card/Card";
import Row from "../../../layout/row/Row";
import Spacer from "../../../layout/spacer/Spacer";
import Button from "../../button/Button";

type PropsType = {
	author: AuthorType;
	editAuthor: Function;
	deleteAuthor: Function;
};

const AuthorCard = (props: PropsType) => (
	<Card padding={15}>
		<Row align="center">
			<span>{props.author.name}</span>
			<Spacer horizontal="flex" />
			<Button
				label="editar"
				size="small"
				buttonAttrs={{
					onClick: () => props.editAuthor(props.author.author_id),
				}}
			/>
			<Spacer horizontal={20} />
			<Button
				label="excluir"
				size="small"
				buttonAttrs={{
					onClick: () => props.deleteAuthor(props.author.author_id),
				}}
			/>
		</Row>
	</Card>
);

export default AuthorCard;
