import { PostType } from "../../types/post";
import { PostsActionsEnum } from "./actions";

type StateType = {
	status: string;
	posts: PostType[];
};

const initialState: StateType = {
	status: "",
	posts: [],
};

export const posts = (state = initialState, action: any) => {
	switch (action.type) {
		case PostsActionsEnum.FETCH_POSTS_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case PostsActionsEnum.FETCH_POSTS_SUCCESS:
			return {
				...state,
				posts: action.posts,
				status: "success",
			};
		case PostsActionsEnum.FETCH_POSTS_FAIL:
			return {
				...state,
				status: "error",
			};
		default:
			return state;
	}
};
