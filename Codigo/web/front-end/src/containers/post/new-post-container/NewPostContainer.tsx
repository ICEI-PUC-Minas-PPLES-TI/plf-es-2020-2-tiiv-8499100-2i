import React, { ChangeEvent, FormEvent, useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";

import { updatePost } from "../../../store/post/actions";
import { fetchAuthors } from "../../../store/authors/actions";
import { postPostAPI } from "../../../api/api";

import PostPage from "../../../pages/post-page/PostPage";

const NewPostContainer = () => {
	const dispatchHook = useDispatch();
	const { post } = useSelector((state: any) => state.post);
	const { authors } = useSelector((state: any) => state.authors);

	useEffect(() => {
		dispatchHook(fetchAuthors());
	}, [dispatchHook]);

	const onChangeImage = (event: ChangeEvent<HTMLInputElement>) => {
		const file = event.target.files ? event.target.files[0] : null;

		if (!file) {
			return;
		}

		dispatchHook(
			updatePost({
				[event.target.id]: file,
			})
		);
	};

	const onChangeInput = (
		event: ChangeEvent<HTMLInputElement | HTMLSelectElement>
	) => {
		dispatchHook(
			updatePost({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onChangeTextArea = (event: ChangeEvent<HTMLTextAreaElement>) => {
		dispatchHook(
			updatePost({
				[event.target.id]: event.target.value,
			})
		);
	};

	const onSubmit = (event: FormEvent<HTMLFormElement>) => {
		event.preventDefault();
		postPostAPI({
			...post,
			date: new Date(),
		});
	};

	return (
		<PostPage
			type="new"
			onSubmit={onSubmit}
			onChangeImage={onChangeImage}
			onChangeInput={onChangeInput}
			onChangeTextArea={onChangeTextArea}
			post={post}
			authors={authors}
		/>
	);
};

export default NewPostContainer;
