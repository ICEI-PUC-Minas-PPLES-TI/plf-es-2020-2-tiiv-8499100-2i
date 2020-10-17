import React, { ChangeEvent } from "react";
import { FormEvent } from "react";

import Column from "../../layout/column/Column";
import Row from "../../layout/row/Row";
import TextField from "../../components/text-field/TextField";
import Spacer from "../../layout/spacer/Spacer";
import Button from "../../components/button/Button";
import { VideoSubcategoryType, VideoCategoryType } from "../../types/category";
import Dropdown from "../../components/dropdown/Dropdown";
import { Link } from "react-router-dom";

type PropsType = {
	onSubmit: (event: FormEvent<HTMLFormElement>) => void;
	onChangeInput: (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => void;
	type: "new" | "update";
	videoSubcategory: VideoSubcategoryType;
	videoCategories: VideoCategoryType[];
};

const VideoSubcategoryPage = (props: PropsType) => (
	<form onSubmit={props.onSubmit}>
		<Column align="center">
			<Row>
				<TextField
					label="Nome da subcategoria de vídeo"
					inputAttrs={{
						id: "name",
						placeholder: "Exemplo: Principais",
						onChange: props.onChangeInput,
						value: props.videoSubcategory.name,
					}}
				/>
			</Row>
			<Spacer vertical={40} />
			<Row>
				<Dropdown
					label="Selecione uma categoria..."
					options={props.videoCategories?.map((videoCategory) => ({
						label: videoCategory.name,
						value: videoCategory.id,
					}))}
					inputAttrs={{
						id: "category_id",
						onChange: props.onChangeInput,
						defaultValue: props.videoSubcategory.categoryId ?? "",
					}}
				/>
			</Row>
			<Spacer vertical={40} />
			<Link to="/categoria-video">Gerenciar categorias de vídeos</Link>
			<Spacer vertical={40} />
			<Button
				label={
					props.type === "new"
						? "Cadastrar Subcategoria de Vídeo"
						: props.type === "update"
						? "Atualizar Subcategoria de Vídeo"
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

export default VideoSubcategoryPage;
