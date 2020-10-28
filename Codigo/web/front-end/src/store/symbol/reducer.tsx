import { SymbolActionsEnum } from "./actions";

type StateType = {
	status: string;
	symbol: any;
};

const initialState: StateType = {
	status: "",
	symbol: {
		title: "",
		body: "",
		img: "",
		subcategory_id: "",
	},
};

export const symbol = (state = initialState, action: any) => {
	switch (action.type) {
		case SymbolActionsEnum.FETCH_SYMBOL_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case SymbolActionsEnum.FETCH_SYMBOL_SUCCESS:
			return {
				...state,
				symbol: action.symbol,
				status: "success",
			};
		case SymbolActionsEnum.FETCH_SYMBOL_FAIL:
			return {
				...state,
				status: "error",
			};
		case SymbolActionsEnum.UPDATE_SYMBOL:
			return {
				...state,
				symbol: {
					...state.symbol,
					...action.symbol,
				},
			};
		case SymbolActionsEnum.CLEAR_SYMBOL:
			return initialState;
		default:
			return state;
	}
};
