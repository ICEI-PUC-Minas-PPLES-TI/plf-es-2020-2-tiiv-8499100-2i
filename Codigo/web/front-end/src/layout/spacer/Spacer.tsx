import React from "react";

type PropsType = {
	horizontal?: number | "flex";
	vertical?: number;
};

const Spacer = (props: PropsType) => {
	const css =
		typeof props.horizontal === "number"
			? {
					marginRight: `${props.horizontal}px`,
			  }
			: {
					flex: "1 1",
			  };

	return (
		<div
			style={{
				marginBottom: `${props.vertical ?? 0}px`,
				...css,
			}}
		/>
	);
};

export default Spacer;
