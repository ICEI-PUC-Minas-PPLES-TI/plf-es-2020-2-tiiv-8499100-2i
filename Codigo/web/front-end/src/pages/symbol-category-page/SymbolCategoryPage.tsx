import React, { ChangeEvent } from "react";
import { FormEvent } from "react";

import Column from "../../layout/column/Column";
import Row from "../../layout/row/Row";
import TextField from "../../components/text-field/TextField";
import Spacer from "../../layout/spacer/Spacer";
import Button from "../../components/button/Button";
import { SymbolCategoryType } from "../../types/category";

type PropsType = {
	onSubmit: (event: FormEvent<HTMLFormElement>) => void;
	onChangeInput: (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => void;
	type: "new" | "update";
	symbolCategory: SymbolCategoryType;
};

const SymbolCategoryPage = (props: PropsType) => (
	<form onSubmit={props.onSubmit}>
		<Column align="center">
			<Row>
				<TextField
					label="Nome da categoria de símbolo"
					inputAttrs={{
						id: "name",
						placeholder: "Exemplo: Principais",
						onChange: props.onChangeInput,
						value: props.symbolCategory.name,
					}}
				/>
			</Row>
			<Spacer vertical={40} />
			<Button
				label={
					props.type === "new"
						? "Cadastrar Categoria de Símbolo"
						: props.type === "update"
						? "Atualizar Categoria de Símbolo"
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

export default SymbolCategoryPage;
