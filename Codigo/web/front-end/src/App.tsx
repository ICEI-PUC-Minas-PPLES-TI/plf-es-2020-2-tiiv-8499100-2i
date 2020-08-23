import React from "react";
import { Provider } from "react-redux";
import { BrowserRouter, Route, Switch } from "react-router-dom";

import { store } from "./store/index";

import ViewAuthorContainer from "./containers/author/view-author-container/ViewAuthorContainer";
import NewAuthorContainer from "./containers/author/new-author-container/NewAuthorContainer";
import NewPostContainer from "./containers/post/new-post-container/NewPostContainer";
import NewSymbolContainer from "./containers/symbol/new-symbol-container/NewSymbolContainer";
import Header from "./layout/header/Header";
import Card from "./components/card/Card";
import Body from "./layout/body/Body";
import EditAuthorContainer from "./containers/author/edit-author-container/EditAuthorContainer";
import ViewPostContainer from "./containers/post/view-post-container/ViewPostContainer";
import EditPostContainer from "./containers/post/edit-post-container/EditPostContainer";
import ViewSymbolContainer from "./containers/symbol/view-symbol-container/ViewSymbolContainer";
import EditSymbolContainer from "./containers/symbol/edit-symbol-container/EditSymbolContainer";
import NewVideoContainer from "./containers/video/new-video-container/NewVideoContainer";
import EditVideoContainer from "./containers/video/edit-video-container/EditVideoContainer";
import ViewVideoContainer from "./containers/video/view-video-container/ViewVideoContainer";
import HomeContainer from "./containers/home-container/HomeContainer";
import LoginContainer from "./containers/login-container/LoginContainer";
import NewSymbolCategoryContainer from "./containers/symbol-category/new-symbol-category-container/NewSymbolCategoryContainer";
import EditSymbolCategoryContainer from "./containers/symbol-category/edit-symbol-category-container/EditSymbolCategoryContainer";
import NewSymbolSubcategoryContainer from "./containers/symbol-subcategory/new-symbol-subcategory-container/NewSymbolSubcategoryContainer";
import EditSymbolSubcategoryContainer from "./containers/symbol-subcategory/edit-symbol-subcategory-container/EditSymbolSubcategoryContainer";
import NewVideoCategoryContainer from "./containers/video-category/new-video-category-container/NewVideoCategoryContainer";
import EditVideoCategoryContainer from "./containers/video-category/edit-video-category-container/EditVideoCategoryContainer";
import ViewSymbolCategoryContainer from "./containers/symbol-category/view-symbol-category-container/ViewSymbolCategoryContainer";
import ViewSymbolSubcategoryContainer from "./containers/symbol-subcategory/view-symbol-subcategory-container/ViewSymbolSubcategoryContainer";
import ViewVideoCategoryContainer from "./containers/video-category/view-video-category-container/ViewVideoCategoryContainer";
import ViewVideoSubcategoryContainer from "./containers/video-subcategory/view-video-subcategory-container/ViewVideoSubcategoryContainer";
import NewVideoSubcategoryContainer from "./containers/video-subcategory/new-video-subcategory-container/NewVideoSubcategoryContainer";
import ViewAdContainer from "./containers/ad/view-ad-container/ViewAdContainer";
import NewAdContainer from "./containers/ad/new-ad-container/NewAdContainer";
import EditVideoSubcategoryContainer from "./containers/video-subcategory/edit-video-subcategory-container/EditVideoSubcategoryContainer";
import requiresAuth from "./hoc/requiresAuth";
import EditAdContainer from "./containers/ad/edit-ad-container/EditAdContainer";
import StatsGeneral from "./containers/stats-general/StatsGeneral";
import ViewForumPostsContainer from "./containers/forum/ViewForumPostsContainer";
import ViewForumContainer from "./containers/forum/ViewForumContainer";

const App = () => {
	return (
		<Provider store={store}>
			<BrowserRouter>
				<Header />
				<Body>
					<Card width={900}>
						<Switch>
							<Route
								path="/post/novo"
								component={requiresAuth(NewPostContainer)}
							/>
							<Route
								path="/post/:postId"
								component={requiresAuth(EditPostContainer)}
							/>
							<Route
								path="/post"
								component={requiresAuth(ViewPostContainer)}
							/>
							<Route
								path="/simbolo/novo"
								component={requiresAuth(NewSymbolContainer)}
							/>
							<Route
								path="/simbolo/:symbolId"
								component={requiresAuth(EditSymbolContainer)}
							/>
							<Route
								path="/categoria-simbolo/novo"
								component={requiresAuth(
									NewSymbolCategoryContainer
								)}
							/>
							<Route
								path="/categoria-simbolo/:symbolCategoryId"
								component={requiresAuth(
									EditSymbolCategoryContainer
								)}
							/>
							<Route
								path="/categoria-simbolo"
								component={requiresAuth(
									ViewSymbolCategoryContainer
								)}
							/>
							<Route
								path="/subcategoria-simbolo/novo"
								component={requiresAuth(
									NewSymbolSubcategoryContainer
								)}
							/>
							<Route
								path="/subcategoria-simbolo/:symbolSubcategoryId"
								component={requiresAuth(
									EditSymbolSubcategoryContainer
								)}
							/>
							<Route
								path="/subcategoria-simbolo"
								component={requiresAuth(
									ViewSymbolSubcategoryContainer
								)}
							/>
							<Route
								path="/simbolo"
								component={requiresAuth(ViewSymbolContainer)}
							/>
							<Route
								path="/autor/novo"
								component={requiresAuth(NewAuthorContainer)}
							/>
							<Route
								path="/autor/:authorId"
								component={requiresAuth(EditAuthorContainer)}
							/>
							<Route
								path="/autor"
								component={requiresAuth(ViewAuthorContainer)}
							/>
							<Route
								path="/video/novo"
								component={requiresAuth(NewVideoContainer)}
							/>
							<Route
								path="/video/:videoId"
								component={requiresAuth(EditVideoContainer)}
							/>
							<Route
								path="/video"
								component={requiresAuth(ViewVideoContainer)}
							/>
							<Route
								path="/categoria-video/novo"
								component={requiresAuth(
									NewVideoCategoryContainer
								)}
							/>
							<Route
								path="/categoria-video/:videoCategoryId"
								component={requiresAuth(
									EditVideoCategoryContainer
								)}
							/>
							<Route
								path="/categoria-video"
								component={requiresAuth(
									ViewVideoCategoryContainer
								)}
							/>
							<Route
								path="/subcategoria-video/novo"
								component={requiresAuth(
									NewVideoSubcategoryContainer
								)}
							/>
							<Route
								path="/subcategoria-video/:videoSubcategoryId"
								component={requiresAuth(
									EditVideoSubcategoryContainer
								)}
							/>
							<Route
								path="/subcategoria-video"
								component={requiresAuth(
									ViewVideoSubcategoryContainer
								)}
							/>
							<Route
								path="/anuncio/novo"
								component={requiresAuth(NewAdContainer)}
							/>
							<Route
								path="/anuncio/:adId"
								component={EditAdContainer}
							/>
							<Route
								path="/anuncio"
								component={requiresAuth(ViewAdContainer)}
							/>
							<Route
								path="/forum/:forumId"
								component={requiresAuth(
									ViewForumPostsContainer
								)}
							/>
							<Route
								path="/forum"
								component={requiresAuth(ViewForumContainer)}
							/>
							<Route
								path="/estatisticas-gerais"
								component={StatsGeneral}
							/>
							<Route path="/login" component={LoginContainer} />
							<Route
								path="/"
								component={requiresAuth(HomeContainer)}
							/>
						</Switch>
					</Card>
				</Body>
			</BrowserRouter>
		</Provider>
	);
};

export default App;
