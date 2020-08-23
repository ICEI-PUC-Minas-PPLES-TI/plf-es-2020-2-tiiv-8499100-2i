import React, { ChangeEvent, FormEvent } from "react";
import { useSelector, useDispatch } from "react-redux";
import { updateSymbolCategory } from "../../../store/symbolCategory/actions";
import { postSymbolCategoryAPI } from "../../../api/api";
import SymbolCategoryPage from "../../../pages/symbol-category-page/SymbolCategoryPage";

const NewSymbolCategoryContainer = () => {
	const dispatchHook = useDispatch();
	const { symbolCategory } = useSelector(
		(state: any) => state.symbolCategory
	);

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
		postSymbolCategoryAPI(symbolCategory);
	};

	return (
		<SymbolCategoryPage
			type="new"
			onSubmit={onSubmit}
			onChangeInput={onChangeInput}
			symbolCategory={symbolCategory}
		/>
	);
};

export default NewSymbolCategoryContainer;
