export type SymbolCategoryType = {
	symbol_category_id: string;
	name: string;
};

export type SymbolSubcategoryType = {
	symbol_sub_category_id: string;
	name: string;
	category_id: string;
};

export type VideoCategoryType = {
	video_category_id: string;
	name: string;
};

export type VideoSubcategoryType = {
	video_sub_category_id: string;
	name: string;
	category_id: string;
};
