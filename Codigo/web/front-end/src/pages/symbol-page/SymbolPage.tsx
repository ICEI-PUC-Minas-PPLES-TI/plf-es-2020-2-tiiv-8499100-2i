import React, { FormEvent, ChangeEvent } from "react";

import { SymbolType } from "../../types/symbol";

import Column from "../../layout/column/Column";
import ImageField from "../../components/image-field/ImageField";
import Spacer from "../../layout/spacer/Spacer";
import Row from "../../layout/row/Row";
import TextField from "../../components/text-field/TextField";
import TextArea from "../../components/text-area/TextArea";
import Button from "../../components/button/Button";
import Dropdown from "../../components/dropdown/Dropdown";
import { SymbolSubcategoryType } from "../../types/category";
import { Link } from "react-router-dom";

type PropsType = {
	onSubmit: (event: FormEvent<HTMLFormElement>) => void;
	onChangeImage: (event: ChangeEvent<HTMLInputElement>) => void;
	onChangeInput: (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => void;
	onChangeTextArea: (event: ChangeEvent<HTMLTextAreaElement>) => void;
	type: "new" | "update";
	symbol: SymbolType;
	symbolSubcategories: SymbolSubcategoryType[];
};

const SymbolPage = (props: PropsType) => (
	<form onSubmit={props.onSubmit}>
		<Column align="center">
			<ImageField
				label="Selecione uma imagem de destaque"
				imagePreview={props.symbol.img}
				width={225}
				height={225}
				inputAttrs={{
					id: "img",
					onChange: props.onChangeImage,
				}}
			/>
			<Spacer vertical={40} />
			<Row>
				<TextField
					label="Título do símbolo"
					inputAttrs={{
						id: "title",
						placeholder: "Exemplo: Straightness",
						onChange: props.onChangeInput,
						value: props.symbol.title,
					}}
				/>
			</Row>
			<Spacer vertical={40} />
			<Row>
				<TextArea
					label="Descrição do símbolo"
					inputAttrs={{
						id: "body",
						placeholder: 'Exemplo: O símbolo "straightness" significa...',
						onChange: props.onChangeTextArea,
						value: props.symbol.body,
					}}
				/>
			</Row>
			<Spacer vertical={40} />
			<Row>
				<Dropdown
					label="Selecione uma subcategoria..."
					options={props.symbolSubcategories?.map((symbolCategory) => ({
						label: symbolCategory.name,
						value: symbolCategory.id,
					}))}
					inputAttrs={{
						id: "subcategory_id",
						onChange: props.onChangeInput,
						defaultValue: props.symbol.id ?? "",
					}}
				/>
			</Row>
			<Spacer vertical={40} />
			<Link to="/subcategoria-simbolo">
				Gerenciar subcategorias de símbolos
			</Link>
			<Spacer vertical={40} />
			<Button
				label={
					props.type === "new"
						? "Cadastrar Símbolo"
						: props.type === "update"
						? "Atualizar Símbolo"
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

export default SymbolPage;
