import { VideoSubcategoryActionsEnum } from "./actions";

type StateType = {
	status: string;
	videoSubcategory: any;
};

const initialState: StateType = {
	status: "",
	videoSubcategory: {
		name: "",
		category_id: "",
	},
};

export const videoSubcategory = (state = initialState, action: any) => {
	switch (action.type) {
		case VideoSubcategoryActionsEnum.FETCH_VIDEO_SUBCATEGORY_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case VideoSubcategoryActionsEnum.FETCH_VIDEO_SUBCATEGORY_SUCCESS:
			return {
				...state,
				videoSubcategory: action.videoSubcategory,
				status: "success",
			};
		case VideoSubcategoryActionsEnum.FETCH_VIDEO_SUBCATEGORY_FAIL:
			return {
				...state,
				status: "error",
			};
		case VideoSubcategoryActionsEnum.UPDATE_VIDEO_SUBCATEGORY:
			return {
				...state,
				videoSubcategory: {
					...state.videoSubcategory,
					...action.videoSubcategory,
				},
			};
		case VideoSubcategoryActionsEnum.CLEAR_VIDEO_SUBCATEGORY:
			return initialState;
		default:
			return state;
	}
};
