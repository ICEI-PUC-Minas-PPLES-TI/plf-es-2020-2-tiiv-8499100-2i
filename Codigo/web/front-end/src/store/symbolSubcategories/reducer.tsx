import { SymbolSubcategoriesActionsEnum } from "./actions";
import { SymbolSubcategoryType } from "../../types/category";

type StateType = {
	status: string;
	symbolSubcategories: SymbolSubcategoryType[];
};

const initialState: StateType = {
	status: "",
	symbolSubcategories: [],
};

export const symbolSubcategories = (state = initialState, action: any) => {
	switch (action.type) {
		case SymbolSubcategoriesActionsEnum.FETCH_SYMBOL_SUBCATEGORIES_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case SymbolSubcategoriesActionsEnum.FETCH_SYMBOL_SUBCATEGORIES_SUCCESS:
			return {
				symbolSubcategories: action.symbolSubcategories,
				status: "success",
			};
		case SymbolSubcategoriesActionsEnum.FETCH_SYMBOL_SUBCATEGORIES_FAIL:
			return {
				...state,
				status: "error",
			};
		default:
			return state;
	}
};
