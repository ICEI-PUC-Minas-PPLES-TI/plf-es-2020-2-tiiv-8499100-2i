import React, { useEffect, ChangeEvent, FormEvent, useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { updateVideo, fetchVideo } from "../../../store/video/actions";
import { putVideoAPI } from "../../../api/api";
import VideoPage from "../../../pages/video-page/VideoPage";
import { useParams } from "react-router";
import Spinner from "../../../components/spinner/Spinner";
import { fetchVideoSubcategories } from "../../../store/videoSubcategories/actions";

const EditVideoContainer = () => {
	const dispatchHook = useDispatch();
	const { videoId } = useParams();
	const { video } = useSelector((state: any) => state.video);
	const { videoSubcategories, status } = useSelector(
		(state: any) => state.videoSubcategories
	);
	const [videoID, setVideoID] = useState("");

	useEffect(() => {
		if (!videoId) {
			return;
		}

		dispatchHook(fetchVideo(videoId));
		dispatchHook(fetchVideoSubcategories());
	}, [dispatchHook, videoId]);

	const onChangeInput = (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => {
		try {
			const ytId = new URL(event.target.value).searchParams.get("v")!;
			setVideoID(ytId);
		} catch (error) {}

		dispatchHook(
			updateVideo({
				[event.target.id]: event.target.value,
				title: "Título do vídeo",
			})
		);
	};

	const onSubmit = (event: FormEvent<HTMLFormElement>) => {
		event.preventDefault();
		if (!videoId) {
			return;
		}

		putVideoAPI(videoId, video);
	};

	return (
		<div>
			{status === "loading" ? (
				<Spinner />
			) : status === "success" ? (
				<VideoPage
					type="update"
					onSubmit={onSubmit}
					onChangeInput={onChangeInput}
					video={video}
					videoID={videoID}
					videoCategories={videoSubcategories}
				/>
			) : status === "error" ? (
				"error"
			) : null}
		</div>
	);
};

export default EditVideoContainer;
