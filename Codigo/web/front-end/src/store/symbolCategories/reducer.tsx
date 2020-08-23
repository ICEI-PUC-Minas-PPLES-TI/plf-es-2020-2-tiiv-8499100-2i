import { SymbolCategoryType } from "../../types/category";
import { SymbolCategoriesActionsEnum } from "./actions";

type StateType = {
	status: string;
	symbolCategories: SymbolCategoryType[];
};

const initialState: StateType = {
	status: "",
	symbolCategories: [],
};

export const symbolCategories = (state = initialState, action: any) => {
	switch (action.type) {
		case SymbolCategoriesActionsEnum.FETCH_SYMBOL_CATEGORIES_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case SymbolCategoriesActionsEnum.FETCH_SYMBOL_CATEGORIES_SUCCESS:
			return {
				symbolCategories: action.symbolCategories,
				status: "success",
			};
		case SymbolCategoriesActionsEnum.FETCH_SYMBOL_CATEGORIES_FAIL:
			return {
				...state,
				status: "error",
			};
		default:
			return state;
	}
};
