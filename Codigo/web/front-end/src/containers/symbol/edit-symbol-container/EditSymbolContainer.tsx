import React, { ChangeEvent, FormEvent, useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { useParams } from "react-router";

import { updatePost } from "../../../store/post/actions";
import { putSymbolAPI } from "../../../api/api";

import Spinner from "../../../components/spinner/Spinner";
import SymbolPage from "../../../pages/symbol-page/SymbolPage";
import { fetchSymbol } from "../../../store/symbol/actions";
import { fetchSymbolSubcategories } from "../../../store/symbolSubcategories/actions";

const EditSymbolContainer = () => {
	const dispatchHook = useDispatch();
	const { symbolId } = useParams();
	const { symbol } = useSelector((state: any) => state.symbol);
	const { symbolSubcategories, status } = useSelector(
		(state: any) => state.symbolSubcategories
	);

	const onChangeImage = (event: ChangeEvent<HTMLInputElement>) => {
		const file = event.target.files ? event.target.files[0] : null;

		if (!file) {
			return;
		}

		dispatchHook(
			updatePost({
				[event.target.id]: file,
			})
		);
	};

	const onChangeInput = (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => {
		dispatchHook(
			updatePost({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onChangeTextArea = (event: ChangeEvent<HTMLTextAreaElement>) => {
		dispatchHook(
			updatePost({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onSubmit = (event: FormEvent<HTMLFormElement>) => {
		event.preventDefault();
		if (!symbolId) {
			return;
		}

		putSymbolAPI(symbolId, symbol);
	};

	useEffect(() => {
		if (!symbolId) {
			return;
		}

		dispatchHook(fetchSymbol(symbolId));
		dispatchHook(fetchSymbolSubcategories());
	}, [dispatchHook, symbolId]);

	return (
		<>
			{status === "loading" ? (
				<Spinner />
			) : status === "success" ? (
				<SymbolPage
					type={"update"}
					onChangeImage={onChangeImage}
					onChangeInput={onChangeInput}
					onChangeTextArea={onChangeTextArea}
					onSubmit={onSubmit}
					symbol={symbol}
					symbolSubcategories={symbolSubcategories}
				/>
			) : status === "error" ? (
				"error"
			) : null}
		</>
	);
};

export default EditSymbolContainer;
