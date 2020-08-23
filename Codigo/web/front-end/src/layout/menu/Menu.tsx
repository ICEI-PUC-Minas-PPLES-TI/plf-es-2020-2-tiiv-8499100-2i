import React, { useState } from "react";
import { Link } from "react-router-dom";

import classes from "./Menu.module.css";

const Menu = () => {
	const [menuOpen, setMenuOpen] = useState(false);

	const menuClickHandler = () => {
		setMenuOpen(!menuOpen);
	};

	const closeMenu = () => {
		setMenuOpen(false);
	};

	return (
		<>
			<button
				className={classes["menu-button"]}
				onClick={menuClickHandler}
			>
				<i className={classes["menu-icon"]} />
				<i className={classes["menu-icon"]} />
				<i className={classes["menu-icon"]} />
			</button>
			{menuOpen ? (
				<div className={classes["menu-full"]}>
					<nav className={classes["menu-nav"]}>
						<Link
							onClick={closeMenu}
							className={classes["menu-nav-item"]}
							to="/"
						>
							Home
						</Link>
						<Link
							onClick={closeMenu}
							className={classes["menu-nav-item"]}
							to="/post"
						>
							Posts
						</Link>
						<Link
							onClick={closeMenu}
							className={classes["menu-nav-item"]}
							to="/simbolo"
						>
							Símbolos
						</Link>
						<Link
							onClick={closeMenu}
							className={classes["menu-nav-item"]}
							to="/video"
						>
							Vídeos
						</Link>
					</nav>
				</div>
			) : null}
		</>
	);
};

export default Menu;
