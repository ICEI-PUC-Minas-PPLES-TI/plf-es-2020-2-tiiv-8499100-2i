import * as firebase from "firebase/app";
import "firebase/auth";
import "firebase/database";
import { YoutubeDataAPI } from "youtube-v3-api";
import { PostType } from "../types/post";
import { AuthorType } from "../types/author";
import { GDTSymbolType } from "../types/symbol";
import { formatPost, composeFormData } from "../utils/utils";
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

const getReq = async (endpoint: string) => {
	try {
		const data = await fetch(`http://localhost:5000/${endpoint}`, {
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
		return fetch(`http://localhost:5000/${endpoint}`, {
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
		return fetch(`http://localhost:5000/${endpoint}`, {
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
		return fetch(`http://localhost:5000/${endpoint}`, {
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
export const auth = firebase.auth;
export const realtimeDatabase = firebase.database;

// Post
export const getPostAPI = (postId: string): Promise<PostType> => {
	return getReq(`post/${postId}`);
};

export const getPostsAPI = (): Promise<PostType[]> => {
	return getReq("post");
};

export const postPostAPI = (data: PostType) => {
	return postReq("post", formatPost(data));
};

export const putPostAPI = (postId: string, data: PostType) => {
	return putReq(`post/${postId}`, data);
};

export const deletePostAPI = (postId: string) => {
	return deleteReq(`post/${postId}`);
};

// Author
export const getAuthorAPI = (authorId: string): Promise<AuthorType> => {
	return getReq(`author/${authorId}`);
};

export const getAuthorsAPI = (): Promise<AuthorType[]> => {
	return getReq("author");
};

export const postAuthorAPI = (data: AuthorType) => {
	return postReq("author", data);
};

export const putAuthorAPI = (authorId: string, data: AuthorType) => {
	return putReq(`author/${authorId}`, data);
};

export const deleteAuthorAPI = (authorId: string) => {
	return deleteReq(`author/${authorId}`);
};

// Symbol
export const getSymbolAPI = (symbolId: string): Promise<GDTSymbolType> => {
	return getReq(`symbol/${symbolId}`);
};

export const getSymbolsAPI = (): Promise<GDTSymbolType[]> => {
	return getReq("symbol");
};

export const postSymbolAPI = (data: GDTSymbolType) => {
	return postReq("symbol", data);
};

export const putSymbolAPI = (symbolId: string, data: GDTSymbolType) => {
	return putReq(`symbol/${symbolId}`, data);
};

export const deleteSymbolAPI = (symbolId: string) => {
	return deleteReq(`symbol/${symbolId}`);
};

// Symbol Subcategory
export const getSymbolSubcategoryAPI = (
	symbolSubcategoryId: string
): Promise<SymbolSubcategoryType> => {
	return getReq(`symbol_sub_category/${symbolSubcategoryId}`);
};

export const getSymbolSubcategoriesAPI = (): Promise<
	SymbolSubcategoryType[]
> => {
	return getReq("symbol_sub_category");
};

export const postSymbolSubcategoryAPI = (data: SymbolSubcategoryType) => {
	return postReq("symbol_sub_category", data);
};

export const putSymbolSubcategoryAPI = (
	symbolSubcategoryId: string,
	data: SymbolSubcategoryType
) => {
	return putReq(`symbol_sub_category/${symbolSubcategoryId}`, data);
};

export const deleteSymbolSubcategoryAPI = (symbolSubcategoryId: string) => {
	return deleteReq(`symbol_sub_category/${symbolSubcategoryId}`);
};

// Symbol Category
export const getSymbolCategoryAPI = (
	symbolCategoryId: string
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
	symbolCategoryId: string,
	data: SymbolCategoryType
) => {
	return putReq(`symbol_category/${symbolCategoryId}`, data);
};

export const deleteSymbolCategoryAPI = (symbolCategoryId: string) => {
	return deleteReq(`symbol_category/${symbolCategoryId}`);
};

// Video
export const getVideoAPI = (videoId: string): Promise<VideoType> => {
	return getReq(`video/${videoId}`);
};

export const getVideosAPI = (): Promise<VideoType[]> => {
	return getReq("video");
};

export const postVideoAPI = (data: VideoType) => {
	return postReq("video", data);
};

export const putVideoAPI = (videoId: string, data: VideoType) => {
	return putReq(`video/${videoId}`, data);
};

export const deleteVideoAPI = (videoId: string) => {
	return deleteReq(`video/${videoId}`);
};

// Video Category
export const getVideoCategoryAPI = (
	videoCategoryId: string
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
	videoCategoryId: string,
	data: VideoCategoryType
) => {
	return putReq(`video_category/${videoCategoryId}`, data);
};

export const deleteVideoCategoryAPI = (videoCategoryId: string) => {
	return deleteReq(`video_category/${videoCategoryId}`);
};

// Video Category
export const getVideoSubcategoryAPI = (
	videoSubcategoryId: string
): Promise<VideoSubcategoryType> => {
	return getReq(`video_sub_category/${videoSubcategoryId}`);
};

export const getVideoSubcategoriesAPI = (): Promise<VideoCategoryType[]> => {
	return getReq("video_sub_category");
};

export const postVideoSubcategoryAPI = (data: VideoSubcategoryType) => {
	return postReq("video_sub_category", data);
};

export const putVideoSubcategoryAPI = (
	videoSubcategoryId: string,
	data: VideoSubcategoryType
) => {
	return putReq(`video_sub_category/${videoSubcategoryId}`, data);
};

export const deleteVideoSubcategoryAPI = (videoSubcategoryId: string) => {
	return deleteReq(`video_sub_category/${videoSubcategoryId}`);
};

// Ad
export const getAdAPI = (adId: string): Promise<AdType> => {
	return getReq(`ad/${adId}`);
};

export const getAdsAPI = (): Promise<AdType[]> => {
	return getReq("ad");
};

export const postAdAPI = (data: AdType) => {
	return postReq("ad", data);
};

export const putAdAPI = (adId: string, data: AdType) => {
	return putReq(`ad/${adId}`, data);
};

export const deleteAdAPI = (adId: string) => {
	return deleteReq(`ad/${adId}`);
};

// Forum
export const getForumsAPI = (): Promise<ForumType[]> => {
	return getReq("forum");
};

export const getForumAPI = (forumId: number): Promise<ForumType[]> => {
	return getReq(`forum/${forumId}`);
};

export const deleteForumAPI = (forumId: string) => {
	return deleteReq(`forum/${forumId}`);
};

// Forum Post
export const getForumPostsAPI = (): Promise<any[]> => {
	return getReq("forum_post");
};

export const deleteForumPostAPI = (forumId: string) => {
	return deleteReq(`forum/${forumId}`);
};

// User
export const getUserAPI = (uid: string): Promise<UserType> => {
	return getReq(`user/${uid}`);
};

export const getUsersAPI = (): Promise<UserType[]> => {
	return getReq(`user`);
};
