import React, { useEffect, ChangeEvent, FormEvent, useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { updateVideo } from "../../../store/video/actions";
import { postVideoAPI, youtubeAPI } from "../../../api/api";
import VideoPage from "../../../pages/video-page/VideoPage";
import { fetchVideoSubcategories } from "../../../store/videoSubcategories/actions";

const NewVideoContainer = () => {
	const dispatchHook = useDispatch();
	const { video } = useSelector((state: any) => state.video);
	const { videoSubcategories } = useSelector(
		(state: any) => state.videoSubcategories
	);
	const [videoID, setVideoID] = useState("");

	const onChangeInput = (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => {
		try {
			const ytId = new URL(event.target.value).searchParams.get("v")!;
			youtubeAPI.searchVideo(ytId).then((res: any) => {
				const title = res.items[0].snippet.title;
				const date = res.items[0].snippet.publishedAt;

				dispatchHook(
					updateVideo({
						title,
						date,
					})
				);
			});

			setVideoID(ytId);
		} catch (error) {}

		dispatchHook(
			updateVideo({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onSubmit = (event: FormEvent<HTMLFormElement>) => {
		event.preventDefault();
		postVideoAPI(video);
	};

	useEffect(() => {
		dispatchHook(fetchVideoSubcategories());
	}, [dispatchHook]);

	return (
		<VideoPage
			type="new"
			onSubmit={onSubmit}
			onChangeInput={onChangeInput}
			videoID={videoID}
			video={video}
			videoCategories={videoSubcategories}
		/>
	);
};

export default NewVideoContainer;
