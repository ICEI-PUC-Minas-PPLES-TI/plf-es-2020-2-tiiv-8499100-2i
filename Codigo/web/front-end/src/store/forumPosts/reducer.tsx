import { ForumPostsActionsEnum } from "./actions";

type StateType = {
	status: string;
	forumPosts: any[];
};

const initialState: StateType = {
	status: "",
	forumPosts: [],
};

export const forumPosts = (state = initialState, action: any) => {
	switch (action.type) {
		case ForumPostsActionsEnum.FETCH_FORUM_POSTS_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case ForumPostsActionsEnum.FETCH_FORUM_POSTS_SUCCESS:
			return {
				forumPosts: action.forumPosts,
				status: "success",
			};
		case ForumPostsActionsEnum.FETCH_FORUM_POSTS_FAIL:
			return {
				...state,
				status: "error",
			};
		default:
			return state;
	}
};
