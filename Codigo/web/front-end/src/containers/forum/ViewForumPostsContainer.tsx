import React, { useEffect } from "react";
import Title from "../../components/title/Title";
import Spacer from "../../layout/spacer/Spacer";
import Spinner from "../../components/spinner/Spinner";
import ForumPostCard from "../../components/cards/forum-post-card/ForumPostCard";
import { useDispatch, useSelector } from "react-redux";
import { RouterProps, useParams } from "react-router";
import { fetchForum } from "../../store/forum/actions";
import { deleteForumAPI } from "../../api/api";
import DeleteButton from "../../components/delete-button/DeleteButton";

const ViewForumPostsContainer = (props: RouterProps) => {
	const dispatchHook = useDispatch();
	const { forumId } = useParams<any>();
	const { forum, status } = useSelector((state: any) => state.forum);

	useEffect(() => {
		if (typeof forumId === "string") {
			dispatchHook(fetchForum(+forumId));
		}
	}, [dispatchHook, forumId]);

	const deleteForum = async () => {
		try {
			await deleteForumAPI(forumId);
			alert("Fórum deletado com sucesso");
			props.history.push("/forum");
		} catch (error) {
			alert("Ocorreu um erro ao deletar o fórum. Tente novamente mais tarde.");
		}
	};

	const forumsEls = [
		<ForumPostCard />,
		<Spacer vertical={30} />,
		<ForumPostCard />,
		<Spacer vertical={30} />,
		<ForumPostCard />,
		<Spacer vertical={30} />,
		<ForumPostCard />,
	];

	return (
		<div>
			<Title accessories={[<DeleteButton onClick={deleteForum} />]}>
				{forum?.title ?? "Carregando..."}
			</Title>
			<Spacer vertical={40} />
			{status === "loading" ? (
				<Spinner />
			) : status === "success" ? (
				forumsEls
			) : status === "error" ? (
				"error"
			) : null}
		</div>
	);
};

export default ViewForumPostsContainer;
