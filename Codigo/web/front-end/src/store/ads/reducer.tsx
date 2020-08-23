import { AdType } from "../../types/ad";
import { AdsActionsEnum } from "./actions";

type StateType = {
	status: string;
	ads: AdType[];
};

const initialState: StateType = {
	status: "",
	ads: [],
};

export const ads = (state = initialState, action: any) => {
	switch (action.type) {
		case AdsActionsEnum.FETCH_ADS_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case AdsActionsEnum.FETCH_ADS_SUCCESS:
			return {
				ads: action.ads,
				status: "success",
			};
		case AdsActionsEnum.FETCH_ADS_FAIL:
			return {
				...state,
				status: "error",
			};
		default:
			return state;
	}
};
