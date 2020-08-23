import { ForumsActionsEnum } from "./actions";

type StateType = {
	status: string;
	forums: any[];
};

const initialState: StateType = {
	status: "",
	forums: [],
};

export const forums = (state = initialState, action: any) => {
	switch (action.type) {
		case ForumsActionsEnum.FETCH_FORUMS_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case ForumsActionsEnum.FETCH_FORUMS_SUCCESS:
			return {
				forums: action.forums,
				status: "success",
			};
		case ForumsActionsEnum.FETCH_FORUMS_FAIL:
			return {
				...state,
				status: "error",
			};
		default:
			return state;
	}
};
