import React from "react";

import { AdType } from "../../../types/ad";

import Card from "../../card/Card";
import Row from "../../../layout/row/Row";
import Spacer from "../../../layout/spacer/Spacer";
import Button from "../../button/Button";

type PropsType = {
	ad: AdType;
	editAd: Function;
	deleteAd: Function;
};

const AdCard = (props: PropsType) => (
	<Card padding={15}>
		<Row align="center">
			<span>{props.ad.text}</span>
			<Spacer horizontal="flex" />
			<Button
				label="editar"
				size="small"
				buttonAttrs={{
					onClick: () => props.editAd(props.ad.ad_id),
				}}
			/>
			<Spacer horizontal={20} />
			<Button
				label="excluir"
				size="small"
				buttonAttrs={{
					onClick: () => props.deleteAd(props.ad.ad_id),
				}}
			/>
		</Row>
	</Card>
);

export default AdCard;
