import React, { ChangeEvent, FormEvent } from "react";

import { AuthorType } from "../../types/author";

import Column from "../../layout/column/Column";
import Row from "../../layout/row/Row";
import TextField from "../../components/text-field/TextField";
import Spacer from "../../layout/spacer/Spacer";
import TextArea from "../../components/text-area/TextArea";
import Button from "../../components/button/Button";

type PropsType = {
	onSubmit: (event: FormEvent<HTMLFormElement>) => void;
	onChangeInput: (event: ChangeEvent<HTMLInputElement>) => void;
	onChangeTextArea: (event: ChangeEvent<HTMLTextAreaElement>) => void;
	type: "new" | "update";
	author: AuthorType;
};

const AuthorPage = (props: PropsType) => (
	<form onSubmit={props.onSubmit}>
		<Column align="center">
			<Row>
				<TextField
					label="Nome do autor"
					inputAttrs={{
						id: "name",
						placeholder: "Exemplo: João Silva",
						onChange: props.onChangeInput,
						value: props.author.name,
					}}
				/>
			</Row>
			<Spacer vertical={40} />
			<Row>
				<TextArea
					label="Biografia do autor"
					inputAttrs={{
						id: "biography",
						placeholder:
							"Exemplo: João Ferreira da Silva é graduado em Engenharia Mecânica pela UFMG...",
						onChange: props.onChangeTextArea,
						value: props.author.biography,
					}}
				/>
			</Row>
			<Spacer vertical={40} />
			<Button
				label={
					props.type === "new"
						? "Cadastrar Autor"
						: props.type === "update"
						? "Atualizar Autor"
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

export default AuthorPage;
