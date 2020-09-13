import { ForumActionsEnum } from "./actions";

type StateType = {
	status: string;
	forum: any;
	forums: any[];
};

const initialState: StateType = {
	status: "",
	forum: null,
	forums: [],
};

export const forum = (state = initialState, action: any) => {
	switch (action.type) {
		case ForumActionsEnum.FETCH_FORUM_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case ForumActionsEnum.FETCH_FORUM_SUCCESS:
			return {
				...state,
				status: "success",
				forum: action.forum,
			};
		case ForumActionsEnum.FETCH_FORUM_FAIL:
			return {
				...state,
				status: "error",
			};
		case ForumActionsEnum.FETCH_FORUMS_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case ForumActionsEnum.FETCH_FORUMS_SUCCESS:
			return {
				forums: action.forums,
				status: "success",
			};
		case ForumActionsEnum.FETCH_FORUMS_FAIL:
			return {
				...state,
				status: "error",
			};
		default:
			return state;
	}
};
