import { VideoCategoryActionsEnum } from "./actions";

type StateType = {
	status: string;
	videoCategory: any;
};

const initialState: StateType = {
	status: "",
	videoCategory: {
		name: "",
	},
};

export const videoCategory = (state = initialState, action: any) => {
	switch (action.type) {
		case VideoCategoryActionsEnum.FETCH_VIDEO_CATEGORY_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case VideoCategoryActionsEnum.FETCH_VIDEO_CATEGORY_SUCCESS:
			return {
				...state,
				status: "success",
				videoCategory: action.videoCategory,
			};
		case VideoCategoryActionsEnum.FETCH_VIDEO_CATEGORY_FAIL:
			return {
				...state,
				status: "failure",
			};
		case VideoCategoryActionsEnum.UPDATE_VIDEO_CATEGORY:
			return {
				...state,
				videoCategory: {
					...state.videoCategory,
					...action.videoCategory,
				},
			};
		case VideoCategoryActionsEnum.CLEAR_VIDEO_CATEGORY:
			return initialState;
		default:
			return state;
	}
};
