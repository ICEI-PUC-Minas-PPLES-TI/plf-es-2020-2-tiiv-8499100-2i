import { getForumsAPI } from "../../api/api";

export enum ForumsActionsEnum {
	FETCH_FORUMS_BEGIN = "FETCH_FORUMS_BEGIN",
	FETCH_FORUMS_SUCCESS = "FETCH_FORUMS_SUCCESS",
	FETCH_FORUMS_FAIL = "FETCH_FORUMS_FAIL",
}

export const fetchForumsBegin = () => ({
	type: ForumsActionsEnum.FETCH_FORUMS_BEGIN,
});

export const fetchForumsSuccess = (forums: any[]) => {
	return {
		type: ForumsActionsEnum.FETCH_FORUMS_SUCCESS,
		forums,
	};
};

export const fetchForumsFail = () => ({
	type: ForumsActionsEnum.FETCH_FORUMS_FAIL,
});

export const fetchForums = () => {
	return async (dispatch: any) => {
		dispatch(fetchForumsBegin());

		try {
			const data = await getForumsAPI();
			dispatch(fetchForumsSuccess(data));
		} catch (error) {
			dispatch(fetchForumsFail());
		}
	};
};
