import { VideoType } from "../../types/video";
import { VideosActionsEnum } from "./actions";

type StateType = {
	status: string;
	videos: VideoType[];
};

const initialState: StateType = {
	status: "",
	videos: [],
};

export const videos = (state = initialState, action: any) => {
	switch (action.type) {
		case VideosActionsEnum.FETCH_VIDEOS_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case VideosActionsEnum.FETCH_VIDEOS_SUCCESS:
			return {
				...state,
				videos: action.videos,
				status: "success",
			};
		case VideosActionsEnum.FETCH_VIDEOS_FAIL:
			return {
				...state,
				status: "error",
			};
		default:
			return state;
	}
};
