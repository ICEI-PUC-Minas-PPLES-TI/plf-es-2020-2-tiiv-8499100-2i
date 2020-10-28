import * as firebase from "firebase/app";
import "firebase/auth";
import "firebase/database";
import { YoutubeDataAPI } from "youtube-v3-api";
import { PostType } from "../types/post";
import { AuthorType } from "../types/author";
import { SymbolType } from "../types/symbol";
import { composeFormData } from "../utils/utils";
import { VideoType } from "../types/video";
import {
	SymbolSubcategoryType,
	VideoCategoryType,
	SymbolCategoryType,
	VideoSubcategoryType,
} from "../types/category";
import { AdType } from "../types/ad";
import { UserType } from "../types/user";
import { ForumType } from "../types/forum";

const authKey =
	"Basic TmpkamNqWTBhSEpqTjJnNE1tNWtNak5xYTNNME4yTjFhMjpwbVpYSnVOM2RvTkdOeU5ETjRaV3QzYm1Ob2NtVnk=";

const baseURL = "http://localhost:5000";

const getReq = async (endpoint: string) => {
	try {
		const data = await fetch(`${baseURL}/${endpoint}`, {
			method: "GET",
			headers: {
				"Content-Type": "application/json",
				Authorization: "Basic " + authKey,
			},
		});
		const json = await data.json();

		return json;
	} catch (error) {
		throw error;
	}
};

const postReq = async (endpoint: string, data: object) => {
	try {
		return fetch(`${baseURL}/${endpoint}`, {
			method: "POST",
			headers: {
				Authorization: "Basic " + authKey,
			},
			body: composeFormData(data),
		});
	} catch (error) {
		throw error;
	}
};

const putReq = async (endpoint: string, data: object) => {
	try {
		return fetch(`${baseURL}/${endpoint}`, {
			method: "PUT",
			headers: {
				Authorization: "Basic " + authKey,
			},
			body: composeFormData(data),
		});
	} catch (error) {
		throw error;
	}
};

const deleteReq = async (endpoint: string) => {
	try {
		return fetch(`${baseURL}/${endpoint}`, {
			method: "DELETE",
			headers: {
				"Content-Type": "application/json",
				Authorization: "Basic " + authKey,
			},
		});
	} catch (error) {
		throw error;
	}
};

// Youtube
export const youtubeAPI = new YoutubeDataAPI(
	"AIzaSyBev1DxljYdmWFYaYcudcEzlSxaSi0wdd4"
);

// Firebase Config
const firebaseConfig = {
	apiKey: "AIzaSyBev1DxljYdmWFYaYcudcEzlSxaSi0wdd4",
	authDomain: "tis3-2i.firebaseapp.com",
	databaseURL: "https://tis3-2i.firebaseio.com",
	projectId: "tis3-2i",
	storageBucket: "tis3-2i.appspot.com",
	messagingSenderId: "107175624534",
	appId: "1:107175624534:web:ebd9d4c8ed1ed5c55120f7",
};
firebase.initializeApp(firebaseConfig);

// Auth
export const realtimeDatabase = firebase.database;

export const authenticate = (email: string, password: string) => {
	return postReq("user/login", { email, password });
};

// Post
export const getPostAPI = (postId: number): Promise<PostType> => {
	return getReq(`post/${postId}`);
};

export const getPostsAPI = (): Promise<PostType[]> => {
	return getReq("post");
};

export const postPostAPI = (data: PostType) => {
	console.log(data);
	debugger;
	return postReq("post", data);
};

export const putPostAPI = (postId: number, data: PostType) => {
	return putReq(`post/${postId}`, data);
};

export const deletePostAPI = (postId: number) => {
	return deleteReq(`post/${postId}`);
};

// Author
export const getAuthorAPI = (authorId: number): Promise<AuthorType> => {
	return getReq(`author/${authorId}`);
};

export const getAuthorsAPI = (): Promise<AuthorType[]> => {
	return getReq("author");
};

export const postAuthorAPI = (data: AuthorType) => {
	return postReq("author", data);
};

export const putAuthorAPI = (authorId: number, data: AuthorType) => {
	return putReq(`author/${authorId}`, data);
};

export const deleteAuthorAPI = (authorId: number) => {
	return deleteReq(`author/${authorId}`);
};

// Symbol
export const getSymbolAPI = (symbolId: number): Promise<SymbolType> => {
	return getReq(`symbol/${symbolId}`);
};

export const getSymbolsAPI = (): Promise<SymbolType[]> => {
	return getReq("symbol");
};

export const postSymbolAPI = (data: SymbolType) => {
	return postReq("symbol", data);
};

export const putSymbolAPI = (symbolId: number, data: SymbolType) => {
	return putReq(`symbol/${symbolId}`, data);
};

export const deleteSymbolAPI = (symbolId: number) => {
	return deleteReq(`symbol/${symbolId}`);
};

// Symbol Subcategory
export const getSymbolSubcategoryAPI = (
	symbolSubcategoryId: number
): Promise<SymbolSubcategoryType> => {
	return getReq(`symbol_subcategory/${symbolSubcategoryId}`);
};

export const getSymbolSubcategoriesAPI = (): Promise<
	SymbolSubcategoryType[]
> => {
	return getReq("symbol_subcategory");
};

export const postSymbolSubcategoryAPI = (data: SymbolSubcategoryType) => {
	return postReq("symbol_subcategory", data);
};

export const putSymbolSubcategoryAPI = (
	symbolSubcategoryId: number,
	data: SymbolSubcategoryType
) => {
	return putReq(`symbol_subcategory/${symbolSubcategoryId}`, data);
};

export const deleteSymbolSubcategoryAPI = (symbolSubcategoryId: number) => {
	return deleteReq(`symbol_subcategory/${symbolSubcategoryId}`);
};

// Symbol Category
export const getSymbolCategoryAPI = (
	symbolCategoryId: number
): Promise<SymbolCategoryType> => {
	return getReq(`symbol_category/${symbolCategoryId}`);
};

export const getSymbolCategoriesAPI = (): Promise<SymbolCategoryType[]> => {
	return getReq("symbol_category");
};

export const postSymbolCategoryAPI = (data: SymbolCategoryType) => {
	return postReq("symbol_category", data);
};

export const putSymbolCategoryAPI = (
	symbolCategoryId: number,
	data: SymbolCategoryType
) => {
	return putReq(`symbol_category/${symbolCategoryId}`, data);
};

export const deleteSymbolCategoryAPI = (symbolCategoryId: number) => {
	return deleteReq(`symbol_category/${symbolCategoryId}`);
};

// Video
export const getVideoAPI = (videoId: number): Promise<VideoType> => {
	return getReq(`video/${videoId}`);
};

export const getVideosAPI = (): Promise<VideoType[]> => {
	return getReq("video");
};

export const postVideoAPI = (data: VideoType) => {
	return postReq("video", data);
};

export const putVideoAPI = (videoId: number, data: VideoType) => {
	return putReq(`video/${videoId}`, data);
};

export const deleteVideoAPI = (videoId: number) => {
	return deleteReq(`video/${videoId}`);
};

// Video Category
export const getVideoCategoryAPI = (
	videoCategoryId: number
): Promise<VideoCategoryType> => {
	return getReq(`video_category/${videoCategoryId}`);
};

export const getVideoCategoriesAPI = (): Promise<VideoCategoryType[]> => {
	return getReq("video_category");
};

export const postVideoCategoryAPI = (data: VideoCategoryType) => {
	return postReq("video_category", data);
};

export const putVideoCategoryAPI = (
	videoCategoryId: number,
	data: VideoCategoryType
) => {
	return putReq(`video_category/${videoCategoryId}`, data);
};

export const deleteVideoCategoryAPI = (videoCategoryId: number) => {
	return deleteReq(`video_category/${videoCategoryId}`);
};

// Video Category
export const getVideoSubcategoryAPI = (
	videoSubcategoryId: number
): Promise<VideoSubcategoryType> => {
	return getReq(`video_subcategory/${videoSubcategoryId}`);
};

export const getVideoSubcategoriesAPI = (): Promise<VideoCategoryType[]> => {
	return getReq("video_subcategory");
};

export const postVideoSubcategoryAPI = (data: VideoSubcategoryType) => {
	return postReq("video_subcategory", data);
};

export const putVideoSubcategoryAPI = (
	videoSubcategoryId: number,
	data: VideoSubcategoryType
) => {
	return putReq(`video_subcategory/${videoSubcategoryId}`, data);
};

export const deleteVideoSubcategoryAPI = (videoSubcategoryId: number) => {
	return deleteReq(`video_subcategory/${videoSubcategoryId}`);
};

// Ad
export const getAdAPI = (adId: number): Promise<AdType> => {
	return getReq(`ad/${adId}`);
};

export const getAdsAPI = (): Promise<AdType[]> => {
	return getReq("ad");
};

export const postAdAPI = (data: AdType) => {
	return postReq("ad", data);
};

export const putAdAPI = (adId: number, data: AdType) => {
	return putReq(`ad/${adId}`, data);
};

export const deleteAdAPI = (adId: number) => {
	return deleteReq(`ad/${adId}`);
};

// Forum
export const getForumsAPI = (): Promise<ForumType[]> => {
	return getReq("forum");
};

export const getForumAPI = (forumId: number): Promise<ForumType[]> => {
	return getReq(`forum/${forumId}`);
};

export const deleteForumAPI = (forumId: number) => {
	return deleteReq(`forum/${forumId}`);
};

export const deleteForumPostAPI = (forumPostId: number) => {
	return deleteReq(`forum/${forumPostId}/delete_post`);
};
