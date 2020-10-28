export type PostType = {
	id: number;
	title: string;
	body: string;
	date: Date;
	img?: string;
	authorId: number;
	requiresLogin: boolean;
};
