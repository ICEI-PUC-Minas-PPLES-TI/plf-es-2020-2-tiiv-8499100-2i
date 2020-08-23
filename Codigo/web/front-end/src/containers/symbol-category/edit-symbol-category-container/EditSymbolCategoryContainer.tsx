import React, { useEffect, ChangeEvent, FormEvent } from "react";
import { useParams } from "react-router";
import { useDispatch, useSelector } from "react-redux";

import Spinner from "../../../components/spinner/Spinner";
import {
	fetchSymbolCategory,
	updateSymbolCategory,
} from "../../../store/symbolCategory/actions";
import SymbolCategoryPage from "../../../pages/symbol-category-page/SymbolCategoryPage";
import { putSymbolCategoryAPI } from "../../../api/api";

const EditSymbolCategoryContainer = () => {
	const dispatchHook = useDispatch();
	const { symbolCategoryId } = useParams();
	const { symbolCategory, status } = useSelector(
		(state: any) => state.symbolCategory
	);

	useEffect(() => {
		if (!symbolCategoryId) {
			return;
		}

		dispatchHook(fetchSymbolCategory(symbolCategoryId));
	}, [dispatchHook, symbolCategoryId]);

	const onChangeInput = (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => {
		dispatchHook(
			updateSymbolCategory({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onSubmit = (event: FormEvent<HTMLFormElement>) => {
		event.preventDefault();
		if (!symbolCategoryId) {
			return;
		}

		putSymbolCategoryAPI(symbolCategoryId, symbolCategory);
	};

	return (
		<div>
			{status === "loading" ? (
				<Spinner />
			) : status === "success" ? (
				<SymbolCategoryPage
					type="update"
					onSubmit={onSubmit}
					onChangeInput={onChangeInput}
					symbolCategory={symbolCategory}
				/>
			) : status === "error" ? (
				"error"
			) : null}
		</div>
	);
};

export default EditSymbolCategoryContainer;
