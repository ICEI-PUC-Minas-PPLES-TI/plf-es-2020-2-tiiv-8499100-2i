import React from "react";

import Card from "../../card/Card";
import { GDTSymbolType } from "../../../types/symbol";
import Row from "../../../layout/row/Row";
import Spacer from "../../../layout/spacer/Spacer";
import Button from "../../button/Button";

import * as classes from "./SymbolCard.module.css";

type PropsType = {
	symbol: GDTSymbolType;
	editSymbol: (symbolId: string) => void;
	deleteSymbol: (symbolId: string) => void;
};

const SymbolCard = (props: PropsType) => (
	<Card padding={0}>
		<div className={classes["symbolCard-imageContainer"]}>
			<img
				src={props.symbol.img}
				alt=""
				className={classes["symbolCard-image"]}
			/>
		</div>
		<div className={classes["symbolCard-body"]}>
			<strong className={classes["symbolCard-title"]}>
				{props.symbol.title}
			</strong>
			<Spacer vertical={15} />
			<Row>
				<Button
					label="editar"
					size="small"
					buttonAttrs={{
						onClick: () => props.editSymbol(props.symbol.symbol_id),
					}}
				/>
				<Spacer horizontal="flex" />
				<Button
					label="excluir"
					size="small"
					buttonAttrs={{
						onClick: () =>
							props.deleteSymbol(props.symbol.symbol_id),
					}}
				/>
			</Row>
		</div>
	</Card>
);

export default SymbolCard;
