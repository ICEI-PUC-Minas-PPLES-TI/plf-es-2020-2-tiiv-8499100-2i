import React, { ChangeEvent, FormEvent, useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { useParams } from "react-router";

import { updatePost, fetchPost } from "../../../store/post/actions";
import { fetchAuthors } from "../../../store/authors/actions";
import { putPostAPI } from "../../../api/api";

import PostPage from "../../../pages/post-page/PostPage";
import Spinner from "../../../components/spinner/Spinner";

const EditPostContainer = () => {
	const dispatchHook = useDispatch();
	const { postId } = useParams();
	const { post, status } = useSelector((state: any) => state.post);
	const { authors } = useSelector((state: any) => state.authors);

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
		if (!postId) {
			return;
		}

		putPostAPI(postId, {
			...post,
			date: new Date(),
		});
	};

	useEffect(() => {
		if (!postId) {
			return;
		}

		dispatchHook(fetchPost(postId));
		dispatchHook(fetchAuthors());
	}, [dispatchHook, postId]);

	return (
		<>
			{status === "loading" ? (
				<Spinner />
			) : status === "success" ? (
				<PostPage
					type="update"
					onSubmit={onSubmit}
					onChangeImage={onChangeImage}
					onChangeInput={onChangeInput}
					onChangeTextArea={onChangeTextArea}
					post={post}
					authors={authors}
				/>
			) : status === "error" ? (
				"error"
			) : null}
		</>
	);
};

export default EditPostContainer;
