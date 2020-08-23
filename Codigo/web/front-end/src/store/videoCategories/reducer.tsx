import { VideoCategoriesActionsEnum } from "./actions";
import { VideoCategoryType } from "../../types/category";

type StateType = {
	status: string;
	videoCategories: VideoCategoryType[];
};

const initialState: StateType = {
	status: "",
	videoCategories: [],
};

export const videoCategories = (state = initialState, action: any) => {
	switch (action.type) {
		case VideoCategoriesActionsEnum.FETCH_VIDEO_CATEGORIES_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case VideoCategoriesActionsEnum.FETCH_VIDEO_CATEGORIES_SUCCESS:
			return {
				videoCategories: action.videoCategories,
				status: "success",
			};
		case VideoCategoriesActionsEnum.FETCH_VIDEO_CATEGORIES_FAIL:
			return {
				...state,
				status: "error",
			};
		default:
			return state;
	}
};
