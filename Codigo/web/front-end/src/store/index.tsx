import { combineReducers, createStore, applyMiddleware } from "redux";
import { composeWithDevTools } from "redux-devtools-extension";
import thunk from "redux-thunk";

import { post } from "./post/reducer";
import { posts } from "./posts/reducer";
import { symbol } from "./symbol/reducer";
import { symbols } from "./symbols/reducer";
import { author } from "./author/reducer";
import { authors } from "./authors/reducer";
import { video } from "./video/reducer";
import { videos } from "./videos/reducer";
import { videoCategories } from "./videoCategories/reducer";
import { symbolSubcategories } from "./symbolSubcategories/reducer";
import { symbolCategories } from "./symbolCategories/reducer";
import { symbolSubcategory } from "./symbolSubcategory/reducer";
import { symbolCategory } from "./symbolCategory/reducer";
import { videoCategory } from "./videoCategory/reducer";
import { videoSubcategory } from "./videoSubcategory/reducer";
import { videoSubcategories } from "./videoSubcategories/reducer";
import { ad } from "./ad/reducer";
import { ads } from "./ads/reducer";
import { forums } from "./forums/reducer";
import { forumPosts } from "./forumPosts/reducer";

const reducers = combineReducers({
	post,
	posts,
	symbol,
	symbols,
	symbolSubcategory,
	symbolSubcategories,
	symbolCategory,
	symbolCategories,
	author,
	authors,
	video,
	videos,
	videoCategory,
	videoCategories,
	videoSubcategory,
	videoSubcategories,
	ad,
	ads,
	forums,
	forumPosts,
});

export const store = createStore(
	reducers,
	composeWithDevTools(applyMiddleware(thunk))
);
