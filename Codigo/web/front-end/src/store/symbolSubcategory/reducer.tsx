import { SymbolSubcategoryActionsEnum } from "./actions";

type StateType = {
	status: string;
	symbolSubcategory: any;
};

const initialState: StateType = {
	status: "",
	symbolSubcategory: {
		name: "",
		category_id: "",
	},
};

export const symbolSubcategory = (state = initialState, action: any) => {
	switch (action.type) {
		case SymbolSubcategoryActionsEnum.FETCH_SYMBOL_SUBCATEGORY_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case SymbolSubcategoryActionsEnum.FETCH_SYMBOL_SUBCATEGORY_SUCCESS:
			return {
				...state,
				status: "success",
				symbolSubcategory: action.symbolSubcategory,
			};
		case SymbolSubcategoryActionsEnum.FETCH_SYMBOL_SUBCATEGORY_FAIL:
			return {
				...state,
				status: "failure",
			};
		case SymbolSubcategoryActionsEnum.UPDATE_SYMBOL_SUBCATEGORY:
			return {
				...state,
				symbolSubcategory: {
					...state.symbolSubcategory,
					...action.symbolSubcategory,
				},
			};
		case SymbolSubcategoryActionsEnum.CLEAR_SYMBOL_SUBCATEGORY:
			return initialState;
		default:
			return state;
	}
};
