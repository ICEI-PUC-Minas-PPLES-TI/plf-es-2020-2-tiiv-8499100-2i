import React, { useEffect, ChangeEvent, FormEvent } from "react";
import { useParams } from "react-router";
import { useDispatch, useSelector } from "react-redux";

import Spinner from "../../../components/spinner/Spinner";
import {
	fetchSymbolSubcategory,
	updateSymbolSubcategory,
} from "../../../store/symbolSubcategory/actions";
import { putSymbolSubcategoryAPI } from "../../../api/api";
import SymbolSubcategoryPage from "../../../pages/symbol-subcategory-page/SymbolSubcategoryPage";
import { fetchSymbolCategories } from "../../../store/symbolCategories/actions";

const EditSymbolSubcategoryContainer = () => {
	const dispatchHook = useDispatch();
	const { symbolSubcategoryId } = useParams();
	const { symbolSubcategory } = useSelector(
		(state: any) => state.symbolSubcategory
	);
	const { symbolCategories, status } = useSelector(
		(state: any) => state.symbolCategories
	);

	useEffect(() => {
		if (!symbolSubcategoryId) {
			return;
		}

		dispatchHook(fetchSymbolSubcategory(symbolSubcategoryId));
		dispatchHook(fetchSymbolCategories());
	}, [dispatchHook, symbolSubcategoryId]);

	const onChangeInput = (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => {
		dispatchHook(
			updateSymbolSubcategory({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onSubmit = (event: FormEvent<HTMLFormElement>) => {
		event.preventDefault();
		if (!symbolSubcategoryId) {
			return;
		}

		putSymbolSubcategoryAPI(symbolSubcategoryId, symbolSubcategory);
	};

	return (
		<div>
			{status === "loading" ? (
				<Spinner />
			) : status === "success" ? (
				<SymbolSubcategoryPage
					type="update"
					onSubmit={onSubmit}
					onChangeInput={onChangeInput}
					symbolSubcategory={symbolSubcategory}
					symbolCategories={symbolCategories}
				/>
			) : status === "error" ? (
				"error"
			) : null}
		</div>
	);
};

export default EditSymbolSubcategoryContainer;
