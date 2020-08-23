import { SymbolCategoryEnum } from "./actions";

type StateType = {
	status: string;
	symbolCategory: any;
};

const initialState: StateType = {
	status: "",
	symbolCategory: {
		name: "",
	},
};

export const symbolCategory = (state = initialState, action: any) => {
	switch (action.type) {
		case SymbolCategoryEnum.FETCH_SYMBOL_CATEGORY_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case SymbolCategoryEnum.FETCH_SYMBOL_CATEGORY_SUCCESS:
			return {
				...state,
				status: "success",
				symbolCategory: action.symbolCategory,
			};
		case SymbolCategoryEnum.FETCH_SYMBOL_CATEGORY_FAIL:
			return {
				...state,
				status: "failure",
			};
		case SymbolCategoryEnum.UPDATE_SYMBOL_CATEGORY:
			return {
				...state,
				symbolCategory: {
					...state.symbolCategory,
					...action.symbolCategory,
				},
			};
		case SymbolCategoryEnum.CLEAR_SYMBOL_CATEGORY:
			return initialState;
		default:
			return state;
	}
};
