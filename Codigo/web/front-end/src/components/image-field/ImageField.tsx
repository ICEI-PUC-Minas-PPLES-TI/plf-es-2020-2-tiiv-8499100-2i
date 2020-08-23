import React, { useEffect, useState } from "react";

import * as classes from "./ImageField.module.css";

type PropsType = {
	label: string;
	imagePreview?: File | string;
	width: number;
	height: number;
	inputAttrs: React.InputHTMLAttributes<HTMLInputElement>;
};

const convertFileToURL = (file?: File): Promise<string> => {
	return new Promise((resolve, reject) => {
		if (!file) {
			reject();
			return;
		}

		const reader = new FileReader();
		reader.addEventListener("load", (event) => {
			if (!event.target) {
				reject();
				return;
			}
			resolve(event.target.result as string);
		});

		reader.readAsDataURL(file);
	});
};

const ImageField = (props: PropsType) => {
	const [imageSrc, setImageSrc] = useState("");

	useEffect(() => {
		if (typeof props.imagePreview === "string") {
			setImageSrc(props.imagePreview);
			return;
		}
		convertFileToURL(props.imagePreview)
			.then((result) => {
				setImageSrc(result);
			})
			.catch(() => {
				setImageSrc("");
			});
	}, [props.imagePreview]);

	return (
		<div
			className={classes["imageField"]}
			style={{
				width: props.width,
				height: props.height,
			}}
		>
			<label
				className={classes["imageField-label"]}
				htmlFor={props.inputAttrs.id}
			>
				{props.label}
			</label>
			{imageSrc ? (
				<img
					className={classes["imageField-img"]}
					src={imageSrc}
					alt={props.label}
				/>
			) : null}
			<input
				className={classes["imageField-input"]}
				{...props.inputAttrs}
				type="file"
			/>
		</div>
	);
};

export default ImageField;
