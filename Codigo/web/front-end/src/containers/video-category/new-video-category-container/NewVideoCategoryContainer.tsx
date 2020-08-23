import React, { ChangeEvent, FormEvent } from "react";
import { useSelector, useDispatch } from "react-redux";
import { updateVideoCategory } from "../../../store/videoCategory/actions";
import VideoCategoryPage from "../../../pages/video-category-page/VideoCategoryPage";
import { postVideoCategoryAPI } from "../../../api/api";

const NewVideoCategoryContainer = () => {
	const dispatchHook = useDispatch();
	const { videoCategory } = useSelector((state: any) => state.videoCategory);

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
		postVideoCategoryAPI(videoCategory);
	};

	return (
		<VideoCategoryPage
			type="new"
			onSubmit={onSubmit}
			onChangeInput={onChangeInput}
			videoCategory={videoCategory}
		/>
	);
};

export default NewVideoCategoryContainer;
