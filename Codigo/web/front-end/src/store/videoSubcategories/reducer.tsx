import { VideoSubcategoriesActionsEnum } from "./actions";
import { VideoSubcategoryType } from "../../types/category";

type StateType = {
	status: string;
	videoSubcategories: VideoSubcategoryType[];
};

const initialState: StateType = {
	status: "",
	videoSubcategories: [],
};

export const videoSubcategories = (state = initialState, action: any) => {
	switch (action.type) {
		case VideoSubcategoriesActionsEnum.FETCH_VIDEO_SUBCATEGORIES_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case VideoSubcategoriesActionsEnum.FETCH_VIDEO_SUBCATEGORIES_SUCCESS:
			return {
				videoSubcategories: action.videoSubcategories,
				status: "success",
			};
		case VideoSubcategoriesActionsEnum.FETCH_VIDEO_SUBCATEGORIES_FAIL:
			return {
				...state,
				status: "error",
			};
		default:
			return state;
	}
};
