import React from "react";

import { VideoType } from "../../../types/video";

import Card from "../../card/Card";
import Row from "../../../layout/row/Row";
import Button from "../../button/Button";
import Spacer from "../../../layout/spacer/Spacer";
import * as classes from "./VideoCard.module.css";

type PropsType = {
	video: VideoType;
	editVideo: (videoId: string) => void;
	deleteVideo: (videoId: string) => void;
};

const getThumbnailURL = (url: string) => {
	const ytId = new URL(url).searchParams.get("v");
	const thumbURL = `https://i.ytimg.com/vi/${ytId}/hqdefault.jpg`;

	return thumbURL;
};

const VideoCard = (props: PropsType) => (
	<Card padding={0}>
		<div className={classes["video-thumbnailContainer"]}>
			<img
				className={classes["video-thumbnail"]}
				src={getThumbnailURL(props.video.youtube_url)}
				alt=""
			/>
		</div>
		<div className={classes["videoCard-body"]}>
			<strong className={classes["video-title"]}>
				{props.video.title}
			</strong>
			<Spacer vertical={15} />
			<Row>
				<Button
					label="editar"
					size="small"
					buttonAttrs={{
						onClick: () => props.editVideo(props.video.video_id),
					}}
				/>
				<Spacer horizontal="flex" />
				<Button
					label="excluir"
					size="small"
					buttonAttrs={{
						onClick: () => props.deleteVideo(props.video.video_id),
					}}
				/>
			</Row>
		</div>
	</Card>
);

export default VideoCard;
