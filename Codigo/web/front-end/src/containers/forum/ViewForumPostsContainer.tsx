import React from "react";
import Title from "../../components/title/Title";
import Spacer from "../../layout/spacer/Spacer";
import Spinner from "../../components/spinner/Spinner";
import ForumPostCard from "../../components/cards/forum-post-card/ForumPostCard";

const ViewForumPostsContainer = () => {
	const status: string = "success";
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
			<Title>Dúvida sobre GD&T</Title>
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
