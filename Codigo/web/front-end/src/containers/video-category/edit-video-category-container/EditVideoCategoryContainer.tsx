import React, { useEffect, ChangeEvent, FormEvent } from "react";
import { useParams } from "react-router";
import { useDispatch, useSelector } from "react-redux";

import Spinner from "../../../components/spinner/Spinner";
import VideoCategoryPage from "../../../pages/video-category-page/VideoCategoryPage";
import { putVideoCategoryAPI } from "../../../api/api";
import {
	fetchVideoCategory,
	updateVideoCategory,
} from "../../../store/videoCategory/actions";

const EditVideoCategoryContainer = () => {
	const dispatchHook = useDispatch();
	const { videoCategoryId } = useParams();
	const { videoCategory, status } = useSelector(
		(state: any) => state.videoCategory
	);

	useEffect(() => {
		if (!videoCategoryId) {
			return;
		}

		dispatchHook(fetchVideoCategory(videoCategoryId));
	}, [dispatchHook, videoCategoryId]);

	const onChangeInput = (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => {
		dispatchHook(
			updateVideoCategory({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onSubmit = (event: FormEvent<HTMLFormElement>) => {
		event.preventDefault();
		if (!videoCategoryId) {
			return;
		}

		putVideoCategoryAPI(videoCategoryId, videoCategory);
	};

	return (
		<div>
			{status === "loading" ? (
				<Spinner />
			) : status === "success" ? (
				<VideoCategoryPage
					type="update"
					onSubmit={onSubmit}
					onChangeInput={onChangeInput}
					videoCategory={videoCategory}
				/>
			) : status === "error" ? (
				"error"
			) : null}
		</div>
	);
};

export default EditVideoCategoryContainer;
