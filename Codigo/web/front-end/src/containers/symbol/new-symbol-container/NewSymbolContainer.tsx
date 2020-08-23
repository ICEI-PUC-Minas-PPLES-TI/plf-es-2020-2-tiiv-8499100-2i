import React, { ChangeEvent, FormEvent, useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";

import { postSymbolAPI } from "../../../api/api";
import { updateSymbol } from "../../../store/symbol/actions";

import SymbolPage from "../../../pages/symbol-page/SymbolPage";
import { fetchSymbolSubcategories } from "../../../store/symbolSubcategories/actions";

const NewSymbolContainer = () => {
	const dispatchHook = useDispatch();
	const { symbol } = useSelector((state: any) => state.symbol);
	const { symbolSubcategories } = useSelector(
		(state: any) => state.symbolSubcategories
	);

	useEffect(() => {
		dispatchHook(fetchSymbolSubcategories());
	}, [dispatchHook]);

	const onChangeImage = (event: ChangeEvent<HTMLInputElement>) => {
		const file = event.target.files ? event.target.files[0] : null;

		if (!file) {
			return;
		}

		dispatchHook(
			updateSymbol({
				[event.target.id]: file,
			})
		);
	};

	const onChangeInput = (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => {
		dispatchHook(
			updateSymbol({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onChangeTextArea = (event: ChangeEvent<HTMLTextAreaElement>) => {
		dispatchHook(
			updateSymbol({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onSubmit = (event: FormEvent<HTMLFormElement>) => {
		event.preventDefault();
		postSymbolAPI(symbol);
	};

	return (
		<SymbolPage
			type="new"
			onSubmit={onSubmit}
			onChangeImage={onChangeImage}
			onChangeInput={onChangeInput}
			onChangeTextArea={onChangeTextArea}
			symbol={symbol}
			symbolSubcategories={symbolSubcategories}
		/>
	);
};

export default NewSymbolContainer;
