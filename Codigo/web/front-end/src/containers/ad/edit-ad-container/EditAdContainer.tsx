import React, { ChangeEvent, FormEvent, useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { useParams } from "react-router";

import Spinner from "../../../components/spinner/Spinner";
import { updateAd, fetchAd } from "../../../store/ad/actions";
import { putAdAPI } from "../../../api/api";
import AdPage from "../../../pages/ad-page/AdPage";

const EditAdContainer = () => {
	const dispatchHook = useDispatch();
	const { adId } = useParams();
	const { ad, status } = useSelector((state: any) => state.ad);

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
		if (!adId) {
			return;
		}

		putAdAPI(adId, ad);
	};

	useEffect(() => {
		if (!adId) {
			return;
		}

		dispatchHook(fetchAd(adId));
	}, [dispatchHook, adId]);

	return (
		<>
			{status === "loading" ? (
				<Spinner />
			) : status === "success" ? (
				<AdPage
					type="update"
					onSubmit={onSubmit}
					onChangeImage={onChangeImage}
					onChangeTextArea={onChangeTextArea}
					ad={ad}
				/>
			) : status === "error" ? (
				"error"
			) : null}
		</>
	);
};

export default EditAdContainer;
