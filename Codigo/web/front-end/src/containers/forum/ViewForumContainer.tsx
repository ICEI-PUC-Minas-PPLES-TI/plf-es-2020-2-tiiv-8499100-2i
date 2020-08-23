import React from "react";
import Title from "../../components/title/Title";
import Spacer from "../../layout/spacer/Spacer";
import Spinner from "../../components/spinner/Spinner";

const ViewForumContainer = () => {
	const status = "loading";
	const forumsEls = [];

	return (
		<div>
			<Title>Fóruns</Title>
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

export default ViewForumContainer;
