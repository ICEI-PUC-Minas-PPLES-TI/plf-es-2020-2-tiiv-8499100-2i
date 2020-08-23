export type PostType = {
	post_id: string;
	title: string;
	body: string;
	date: Date;
	img?: string;
	author_id: string;
	user_required: boolean;
};
