import React, { useEffect, ChangeEvent, FormEvent } from "react";
import { useParams } from "react-router";
import { useDispatch, useSelector } from "react-redux";

import { fetchAuthor, updateAuthor } from "../../../store/author/actions";

import AuthorPage from "../../../pages/author-page/AuthorPage";
import Spinner from "../../../components/spinner/Spinner";
import { putAuthorAPI } from "../../../api/api";

const EditAuthorContainer = () => {
	const dispatchHook = useDispatch();
	const { authorId } = useParams();
	const { author, status } = useSelector((state: any) => state.author);

	useEffect(() => {
		if (!authorId) {
			return;
		}

		dispatchHook(fetchAuthor(authorId));
	}, [dispatchHook, authorId]);

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
		if (!authorId) {
			return;
		}

		putAuthorAPI(authorId, author);
	};

	return (
		<div>
			{status === "loading" ? (
				<Spinner />
			) : status === "success" ? (
				<AuthorPage
					type="update"
					onSubmit={onSubmit}
					onChangeInput={onChangeInput}
					onChangeTextArea={onChangeTextArea}
					author={author}
				/>
			) : status === "error" ? (
				"error"
			) : null}
		</div>
	);
};

export default EditAuthorContainer;
