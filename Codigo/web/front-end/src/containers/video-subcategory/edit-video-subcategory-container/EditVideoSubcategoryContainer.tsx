import React, { useEffect, ChangeEvent, FormEvent } from "react";
import { useParams } from "react-router";
import { useDispatch, useSelector } from "react-redux";

import Spinner from "../../../components/spinner/Spinner";
import { putVideoSubcategoryAPI } from "../../../api/api";
import {
	fetchVideoSubcategory,
	updateVideoSubcategory,
} from "../../../store/videoSubcategory/actions";
import VideoSubcategoryPage from "../../../pages/video-subcategory-page/VideoSubcategoryPage";
import { fetchVideoCategories } from "../../../store/videoCategories/actions";

const EditVideoSubcategoryContainer = () => {
	const dispatchHook = useDispatch();
	const { videoSubcategoryId } = useParams();
	const { videoSubcategory, status } = useSelector(
		(state: any) => state.videoSubcategory
	);
	const { videoCategories } = useSelector(
		(state: any) => state.videoCategories
	);

	useEffect(() => {
		if (!videoSubcategoryId) {
			return;
		}

		dispatchHook(fetchVideoCategories());
		dispatchHook(fetchVideoSubcategory(videoSubcategoryId));
	}, [dispatchHook, videoSubcategoryId]);

	const onChangeInput = (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => {
		dispatchHook(
			updateVideoSubcategory({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onSubmit = (event: FormEvent<HTMLFormElement>) => {
		event.preventDefault();
		if (!videoSubcategoryId) {
			return;
		}

		putVideoSubcategoryAPI(videoSubcategoryId, videoSubcategory);
	};

	return (
		<div>
			{status === "loading" ? (
				<Spinner />
			) : status === "success" ? (
				<VideoSubcategoryPage
					type="update"
					onSubmit={onSubmit}
					onChangeInput={onChangeInput}
					videoSubcategory={videoSubcategory}
					videoCategories={videoCategories}
				/>
			) : status === "error" ? (
				"error"
			) : null}
		</div>
	);
};

export default EditVideoSubcategoryContainer;
