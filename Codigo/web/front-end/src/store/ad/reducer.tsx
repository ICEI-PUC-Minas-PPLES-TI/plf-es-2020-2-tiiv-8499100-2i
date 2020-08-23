import { AdActionsEnum } from "./actions";

type StateType = {
	status: string;
	ad: any;
};

const initialState: StateType = {
	status: "",
	ad: {
		text: "",
	},
};

export const ad = (state = initialState, action: any) => {
	switch (action.type) {
		case AdActionsEnum.FETCH_AD_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case AdActionsEnum.FETCH_AD_SUCCESS:
			return {
				...state,
				status: "success",
				ad: action.ad,
			};
		case AdActionsEnum.FETCH_AD_FAIL:
			return {
				...state,
				status: "failure",
			};
		case AdActionsEnum.UPDATE_AD:
			return {
				...state,
				ad: {
					...state.ad,
					...action.ad,
				},
			};
		case AdActionsEnum.CLEAR_AD:
			return initialState;
		default:
			return state;
	}
};
