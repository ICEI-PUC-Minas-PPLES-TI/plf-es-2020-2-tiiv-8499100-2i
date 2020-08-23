import { AuthorActionsEnum } from "./actions";

type StateType = {
	status: string;
	author: any;
};

const initialState: StateType = {
	status: "",
	author: {
		name: "",
		biography: "",
	},
};

export const author = (state = initialState, action: any) => {
	switch (action.type) {
		case AuthorActionsEnum.FETCH_AUTHOR_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case AuthorActionsEnum.FETCH_AUTHOR_SUCCESS:
			return {
				...state,
				status: "success",
				author: action.author,
			};
		case AuthorActionsEnum.FETCH_AUTHOR_FAIL:
			return {
				...state,
				status: "failure",
			};
		case AuthorActionsEnum.UPDATE_AUTHOR:
			return {
				...state,
				author: {
					...state.author,
					...action.author,
				},
			};
		case AuthorActionsEnum.CLEAR_AUTHOR:
			return initialState;
		default:
			return state;
	}
};
