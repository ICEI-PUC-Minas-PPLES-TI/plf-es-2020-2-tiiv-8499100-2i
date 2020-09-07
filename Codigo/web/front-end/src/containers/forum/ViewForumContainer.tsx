import React from "react";
import Title from "../../components/title/Title";
import Spacer from "../../layout/spacer/Spacer";
import Spinner from "../../components/spinner/Spinner";
import ForumCard from "../../components/cards/forum-card/ForumCard";
import Grid from "../../layout/grid/Grid";
import { RouterProps } from "react-router";

const ViewForumContainer = (props: RouterProps) => {
	const status: string = "success";
	const forums = [
		{
			creator: "Lucas A. Gusmão",
			dateCreated: "01/09/2020",
			lastUpdate: "02/09/2020",
			responseCount: 8,
		},
	];
	const forumsEls = forums.map((f, index) => (
		<ForumCard key={index} onClick={() => props.history.push("/forum/aaa")} />
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
