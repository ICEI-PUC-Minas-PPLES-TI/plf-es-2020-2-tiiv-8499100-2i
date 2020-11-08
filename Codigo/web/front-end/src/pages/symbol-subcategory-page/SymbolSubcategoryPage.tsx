import React, { ChangeEvent } from "react";
import { FormEvent } from "react";

import Column from "../../layout/column/Column";
import Row from "../../layout/row/Row";
import TextField from "../../components/text-field/TextField";
import Spacer from "../../layout/spacer/Spacer";
import Button from "../../components/button/Button";
import {
	SymbolSubcategoryType,
	SymbolCategoryType,
} from "../../types/category";
import Dropdown from "../../components/dropdown/Dropdown";
import { Link } from "react-router-dom";

type PropsType = {
	onSubmit: (event: FormEvent<HTMLFormElement>) => void;
	onChangeInput: (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => void;
	type: "new" | "update";
	symbolSubcategory: any;
	symbolCategories: SymbolCategoryType[];
};

const SymbolSubcategoryPage = (props: PropsType) => (
	<form onSubmit={props.onSubmit}>
		<Column align="center">
			<Row>
				<TextField
					label="Nome da subcategoria de símbolo"
					inputAttrs={{
						id: "name",
						placeholder: "Exemplo: Principais",
						onChange: props.onChangeInput,
						value: props.symbolSubcategory.name,
					}}
				/>
			</Row>
			<Spacer vertical={40} />
			<Row>
				<Dropdown
					label="Selecione uma categoria..."
					options={props.symbolCategories?.map((symbolCategory) => ({
						label: symbolCategory.name,
						value: symbolCategory.id,
					}))}
					inputAttrs={{
						id: "category_id",
						onChange: props.onChangeInput,
						defaultValue: props.symbolSubcategory.category_id ?? "",
					}}
				/>
			</Row>
			<Spacer vertical={40} />
			<Link to="/categoria-video">Gerenciar categorias de símbolos</Link>
			<Spacer vertical={40} />
			<Button
				label={
					props.type === "new"
						? "Cadastrar Subcategoria de Símbolo"
						: props.type === "update"
						? "Atualizar Subcategoria de Símbolo"
						: ""
				}
				size="big"
				buttonAttrs={{
					type: "submit",
				}}
			/>
		</Column>
	</form>
);

export default SymbolSubcategoryPage;
