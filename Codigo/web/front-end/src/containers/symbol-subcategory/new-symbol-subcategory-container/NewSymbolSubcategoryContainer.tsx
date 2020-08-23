import React, { ChangeEvent, FormEvent } from "react";
import { useSelector, useDispatch } from "react-redux";
import SymbolSubcategoryPage from "../../../pages/symbol-subcategory-page/SymbolSubcategoryPage";
import { postSymbolSubcategoryAPI } from "../../../api/api";
import { updateSymbolSubcategory } from "../../../store/symbolSubcategory/actions";

const NewSymbolSubcategoryContainer = () => {
	const dispatchHook = useDispatch();
	const { symbolSubcategory } = useSelector(
		(state: any) => state.symbolSubcategory
	);

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
		postSymbolSubcategoryAPI(symbolSubcategory);
	};

	return (
		<SymbolSubcategoryPage
			type="new"
			onSubmit={onSubmit}
			onChangeInput={onChangeInput}
			symbolSubcategory={symbolSubcategory}
			symbolCategories={[]}
		/>
	);
};

export default NewSymbolSubcategoryContainer;
