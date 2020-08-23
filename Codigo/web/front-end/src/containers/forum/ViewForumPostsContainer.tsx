import React from "react";
import Title from "../../components/title/Title";
import Spacer from "../../layout/spacer/Spacer";
import Spinner from "../../components/spinner/Spinner";

const ViewForumPostsContainer = () => {
	const status = "loading";
	const forumsEls = [];

	return (
		<div>
			<Title>Posts do fórum: X</Title>
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
