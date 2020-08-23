import { getForumPostsAPI } from "../../api/api";

export enum ForumPostsActionsEnum {
	FETCH_FORUM_POSTS_BEGIN = "FETCH_FORUM_POSTS_BEGIN",
	FETCH_FORUM_POSTS_SUCCESS = "FETCH_FORUM_POSTS_SUCCESS",
	FETCH_FORUM_POSTS_FAIL = "FETCH_FORUM_POSTS_FAIL",
}

export const fetchForumPostsBegin = () => ({
	type: ForumPostsActionsEnum.FETCH_FORUM_POSTS_BEGIN,
});

export const fetchForumPostsSuccess = (forumPosts: any[]) => {
	return {
		type: ForumPostsActionsEnum.FETCH_FORUM_POSTS_SUCCESS,
		forumPosts,
	};
};

export const fetchForumPostsFail = () => ({
	type: ForumPostsActionsEnum.FETCH_FORUM_POSTS_FAIL,
});

export const fetchForumPosts = () => {
	return async (dispatch: any) => {
		dispatch(fetchForumPostsBegin());

		try {
			const data = await getForumPostsAPI();
			dispatch(fetchForumPostsSuccess(data));
		} catch (error) {
			dispatch(fetchForumPostsFail());
		}
	};
};
