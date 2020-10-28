import { VideoActionsEnum } from "./actions";

type StateType = {
	status: string;
	video: any;
};

const initialState: StateType = {
	status: "",
	video: {
		youtube_url: "",
		title: "",
		date: "",
		subcategory_id: "",
	},
};

export const video = (state = initialState, action: any) => {
	switch (action.type) {
		case VideoActionsEnum.FETCH_VIDEO_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case VideoActionsEnum.FETCH_VIDEO_SUCCESS:
			return {
				...state,
				video: action.video,
				status: "success",
			};
		case VideoActionsEnum.FETCH_VIDEO_FAIL:
			return {
				...state,
				status: "error",
			};
		case VideoActionsEnum.UPDATE_VIDEO:
			return {
				...state,
				video: {
					...state.video,
					...action.video,
				},
			};
		case VideoActionsEnum.CLEAR_VIDEO:
			return initialState;
		default:
			return state;
	}
};
