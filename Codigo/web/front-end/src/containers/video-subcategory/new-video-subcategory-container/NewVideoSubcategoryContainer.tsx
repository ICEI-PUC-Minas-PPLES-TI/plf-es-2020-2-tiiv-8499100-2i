import React, { ChangeEvent, FormEvent, useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import VideoSubcategoryPage from "../../../pages/video-subcategory-page/VideoSubcategoryPage";
import { postVideoSubcategoryAPI } from "../../../api/api";
import { updateVideoSubcategory } from "../../../store/videoSubcategory/actions";
import { fetchVideoCategories } from "../../../store/videoCategories/actions";

const NewVideoSubcategoryContainer = () => {
	const dispatchHook = useDispatch();
	const { videoSubcategory } = useSelector(
		(state: any) => state.videoSubcategory
	);
	const { videoCategories } = useSelector(
		(state: any) => state.videoCategories
	);

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
		postVideoSubcategoryAPI(videoSubcategory);
	};

	useEffect(() => {
		dispatchHook(fetchVideoCategories());
	}, [dispatchHook]);

	return (
		<VideoSubcategoryPage
			type="new"
			onSubmit={onSubmit}
			onChangeInput={onChangeInput}
			videoSubcategory={videoSubcategory}
			videoCategories={videoCategories}
		/>
	);
};

export default NewVideoSubcategoryContainer;
