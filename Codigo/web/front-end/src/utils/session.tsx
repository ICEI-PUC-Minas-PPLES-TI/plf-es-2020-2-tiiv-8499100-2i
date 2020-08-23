import { UserType } from "../types/user";

export const saveUser = (user: UserType) => {
	sessionStorage.setItem("user", JSON.stringify(user));
};

export const retrieveUser = () => {
	try {
		const data = sessionStorage.getItem("user")!;
		const user = JSON.parse(data) as UserType;

		return user;
	} catch {
		return;
	}
};
