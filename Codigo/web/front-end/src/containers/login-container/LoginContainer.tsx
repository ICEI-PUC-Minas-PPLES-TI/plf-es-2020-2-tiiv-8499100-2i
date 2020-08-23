import React from "react";
import { RouteComponentProps } from "react-router";

import LoginPage from "../../pages/login-page/LoginPage";
import { auth, getUserAPI } from "../../api/api";
import { saveUser } from "../../utils/session";

export const LoginContainer = (props: RouteComponentProps) => {
	const onSubmit = async (event: any) => {
		event.preventDefault();
		const email = event.target.elements.email.value;
		const password = event.target.elements.password.value;

		try {
			const authData = await auth().signInWithEmailAndPassword(
				email,
				password
			);
			const { uid } = authData.user!;
			const user = await getUserAPI(uid);

			if (!user.is_admin) {
				throw new Error();
			}

			saveUser(user);
			props.history.push("/");
		} catch {
			alert("Email ou senha incorreto(s).");
		}
	};

	return <LoginPage onSubmit={onSubmit} />;
};

export default LoginContainer;
