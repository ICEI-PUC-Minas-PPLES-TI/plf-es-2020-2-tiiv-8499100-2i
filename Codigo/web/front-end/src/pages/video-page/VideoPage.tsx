import React, { ChangeEvent } from "react";
import { FormEvent } from "react";
import { Link } from "react-router-dom";

import { VideoType } from "../../types/video";
import Column from "../../layout/column/Column";
import Row from "../../layout/row/Row";
import TextField from "../../components/text-field/TextField";
import Spacer from "../../layout/spacer/Spacer";
import Button from "../../components/button/Button";
import { VideoCategoryType } from "../../types/category";
import Dropdown from "../../components/dropdown/Dropdown";
import Video from "../../components/video/Video";

type PropsType = {
	onSubmit: (event: FormEvent<HTMLFormElement>) => void;
	onChangeInput: (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => void;
	type: "new" | "update";
	video: VideoType;
	videoID: string;
	videoCategories: VideoCategoryType[];
};

const VideoPage = (props: PropsType) => {
	return (
		<form onSubmit={props.onSubmit}>
			<Column align="center">
				<Row>
					<Video videoID={props.videoID} />
				</Row>
				<Row>
					<TextField
						label="URL do vídeo"
						inputAttrs={{
							id: "youtube_url",
							placeholder:
								"Exemplo: https://www.youtube.com/watch?v=dQw4w9WgXcQ",
							onChange: props.onChangeInput,
							value: props.video.youtube_url,
						}}
					/>
				</Row>
				<Spacer vertical={40} />
				<Row>
					<Dropdown
						label="Selecione uma subcategoria..."
						options={props.videoCategories?.map((c) => ({
							label: c.name,
							value: c.video_category_id,
						}))}
						inputAttrs={{
							id: "category_id",
							onChange: props.onChangeInput,
							defaultValue: props.video.category_id ?? "",
						}}
					/>
				</Row>
				<Spacer vertical={40} />
				<Link to="/subcategoria-video">
					Gerenciar subcategorias de vídeos
				</Link>
				<Spacer vertical={40} />
				<Button
					label={
						props.type === "new"
							? "Cadastrar Vídeo"
							: props.type === "update"
							? "Atualizar Vídeo"
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
};

export default VideoPage;
