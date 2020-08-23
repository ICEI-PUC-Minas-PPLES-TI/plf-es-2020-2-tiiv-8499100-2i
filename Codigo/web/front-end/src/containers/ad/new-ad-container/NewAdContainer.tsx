import React, { ChangeEvent, FormEvent } from "react";
import { useSelector, useDispatch } from "react-redux";
import { updateAd } from "../../../store/ad/actions";
import { postAdAPI } from "../../../api/api";
import AdPage from "../../../pages/ad-page/AdPage";

const NewAdContainer = () => {
	const dispatchHook = useDispatch();
	const { ad } = useSelector((state: any) => state.ad);

	const onChangeImage = (event: ChangeEvent<HTMLInputElement>) => {
		const file = event.target.files ? event.target.files[0] : null;

		if (!file) {
			return;
		}

		dispatchHook(
			updateAd({
				[event.target.id]: file,
			})
		);
	};

	const onChangeTextArea = (event: ChangeEvent<HTMLTextAreaElement>) => {
		dispatchHook(
			updateAd({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onSubmit = (event: FormEvent<HTMLFormElement>) => {
		event.preventDefault();
		postAdAPI(ad);
	};

	return (
		<AdPage
			type="new"
			onSubmit={onSubmit}
			onChangeImage={onChangeImage}
			onChangeTextArea={onChangeTextArea}
			ad={ad}
		/>
	);
};

export default NewAdContainer;
