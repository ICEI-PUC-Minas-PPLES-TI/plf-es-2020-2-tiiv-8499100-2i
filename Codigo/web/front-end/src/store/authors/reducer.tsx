import { AuthorType } from "../../types/author";
import { AuthorsActionsEnum } from "./actions";

type StateType = {
	status: string;
	authors: AuthorType[];
};

const initialState: StateType = {
	status: "",
	authors: [],
};

export const authors = (state = initialState, action: any) => {
	switch (action.type) {
		case AuthorsActionsEnum.FETCH_AUTHORS_BEGIN:
			return {
				...state,
				status: "loading",
			};
		case AuthorsActionsEnum.FETCH_AUTHORS_SUCCESS:
			return {
				authors: action.authors,
				status: "success",
			};
		case AuthorsActionsEnum.FETCH_AUTHORS_FAIL:
			return {
				...state,
				status: "error",
			};
		default:
			return state;
	}
};
