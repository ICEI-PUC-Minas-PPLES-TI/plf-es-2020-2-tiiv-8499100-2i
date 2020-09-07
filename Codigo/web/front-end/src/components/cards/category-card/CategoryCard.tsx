import React from "react";

import Card from "../../card/Card";
import Row from "../../../layout/row/Row";
import Spacer from "../../../layout/spacer/Spacer";
import Button from "../../button/Button";

type CategoryType = {
	name: string;
};

type PropsType = {
	category: CategoryType;
	idSelector: string;
	editCategory: Function;
	deleteCategory: Function;
};

const CategoryCard = (props: PropsType) => (
	<Card padding={15}>
		<Row align="center">
			<span>{props.category.name}</span>
			<Spacer horizontal="flex" />
			<Button
				label="editar"
				size="small"
				buttonAttrs={{
					onClick: () => props.editCategory(props.category[props.idSelector]),
				}}
			/>
			<Spacer horizontal={20} />
			<Button
				label="excluir"
				size="small"
				buttonAttrs={{
					onClick: () => props.deleteCategory(props.category[props.idSelector]),
				}}
			/>
		</Row>
	</Card>
);

export default CategoryCard;
