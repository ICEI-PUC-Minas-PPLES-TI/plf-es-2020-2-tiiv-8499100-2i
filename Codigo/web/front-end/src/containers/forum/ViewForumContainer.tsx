import React, { useEffect } from "react";
import Title from "../../components/title/Title";
import Spacer from "../../layout/spacer/Spacer";
import Spinner from "../../components/spinner/Spinner";
import ForumCard from "../../components/cards/forum-card/ForumCard";
import Grid from "../../layout/grid/Grid";
import { RouterProps } from "react-router";
import { useDispatch, useSelector } from "react-redux";
import { fetchForums } from "../../store/forum/actions";
import { ForumType } from "../../types/forum";

const ViewForumContainer = (props: RouterProps) => {
	const dispatchHook = useDispatch();
	const { forums, status } = useSelector((state: any) => state.forum);

	useEffect(() => {
		dispatchHook(fetchForums());
	}, [dispatchHook]);

	const forumsEls = forums.map((f: ForumType) => (
		<ForumCard
			key={f.forumId}
			forum={f}
			onClick={() => props.history.push(`/forum/${f.forumId}`)}
		/>
	));

	return (
		<div>
			<Title>Fóruns</Title>
			<Spacer vertical={40} />
			{status === "loading" ? (
				<Spinner />
			) : status === "success" ? (
				<Grid>{forumsEls}</Grid>
			) : status === "error" ? (
				"error"
			) : null}
		</div>
	);
};

export default ViewForumContainer;
