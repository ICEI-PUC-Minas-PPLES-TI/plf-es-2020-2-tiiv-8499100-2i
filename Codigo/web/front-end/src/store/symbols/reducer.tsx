import { GDTSymbolType } from "../../types/symbol";
import { SymbolsActionsEnum } from "./actions";

type StateType = {
	status: string;
	symbols: GDTSymbolType[];
};

const initialState: StateType = {
	status: "",
	symbols: [],
};

export const symbols = (state = initialState, action: any) => {
	switch (action.type) {
		case SymbolsActionsEnum.FETCH_SYMBOLS_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case SymbolsActionsEnum.FETCH_SYMBOLS_SUCCESS:
			return {
				...state,
				symbols: action.symbols,
				status: "success",
			};
		case SymbolsActionsEnum.FETCH_SYMBOLS_FAIL:
			return {
				...state,
				status: "error",
			};
		default:
			return state;
	}
};
