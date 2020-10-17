import React from "react";
import { retrieveUser } from "../utils/session";
import { Redirect } from "react-router";

const requiresAuth = (Component: any) => {
	const ProtectedComponent = (props: any) => {
		const user = retrieveUser();
		if (user && user.isAdmin) {
			return <Component {...props} />;
		}

		return <Redirect to="/login" />;
	};

	return ProtectedComponent;
};

export default requiresAuth;
