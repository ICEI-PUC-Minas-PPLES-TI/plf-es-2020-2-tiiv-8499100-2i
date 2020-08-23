import React, { ChangeEvent, FormEvent } from "react";
import { useSelector, useDispatch } from "react-redux";

import { updateAuthor } from "../../../store/author/actions";
import { postAuthorAPI } from "../../../api/api";

import AuthorPage from "../../../pages/author-page/AuthorPage";

const NewAuthorContainer = () => {
	const dispatchHook = useDispatch();
	const { author } = useSelector((state: any) => state.author);

	const onChangeInput = (event: ChangeEvent<HTMLInputElement>) => {
		dispatchHook(
			updateAuthor({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onChangeTextArea = (event: ChangeEvent<HTMLTextAreaElement>) => {
		dispatchHook(
			updateAuthor({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onSubmit = (event: FormEvent<HTMLFormElement>) => {
		event.preventDefault();
		postAuthorAPI(author);
	};

	return (
		<AuthorPage
			type="new"
			onSubmit={onSubmit}
			onChangeInput={onChangeInput}
			onChangeTextArea={onChangeTextArea}
			author={author}
		/>
	);
};

export default NewAuthorContainer;
