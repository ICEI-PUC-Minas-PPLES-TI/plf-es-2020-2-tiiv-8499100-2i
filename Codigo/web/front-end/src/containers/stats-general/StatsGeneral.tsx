import React from "react";

import * as classes from "./StatsGeneral.module.css";
import Title from "../../components/title/Title";
import Dropdown from "../../components/dropdown/Dropdown";
import Spacer from "../../layout/spacer/Spacer";
import { getViewsCount, getCalculatorViewsCount } from "../../utils/utils";
import Card from "../../components/card/Card";
import Row from "../../layout/row/Row";
import TextField from "../../components/text-field/TextField";
import { getUsersAPI } from "../../api/api";

class StatsGeneral extends React.Component<any, any> {
	state = {
		selectedOption: "",
		statItems: [],
		userList: [],
		userId: undefined,
		initDate: undefined,
		endDate: undefined,
	};

	componentDidMount() {
		getUsersAPI().then((users) => {
			const userList = users.map((user) => ({
				label: `${user.name} | ${user.business_name} | ${user.phone}`,
				value: user.user_id,
			}));

			this.setState({ userList });
		});
	}

	fetchStats = () => {
		if (this.state.selectedOption !== "calculator") {
			getViewsCount(
				this.state.selectedOption,
				this.state.initDate,
				this.state.endDate,
				this.state.userId
			).then((res) => {
				this.setState({ statItems: res });
			});
		} else {
			getCalculatorViewsCount(
				this.state.initDate,
				this.state.endDate,
				this.state.userId
			).then((res) => {
				this.setState({
					statItems: res,
				});
			});
		}
	};

	render() {
		const options = [
			{ label: "Posts", value: "post" },
			{ label: "Símbolos", value: "symbol" },
			{ label: "Vídeos", value: "video" },
			{ label: "Calculadoras", value: "calculator" },
		];

		return (
			<div>
				<Title>Estatísticas Gerais</Title>
				<Spacer vertical={40} />
				<Dropdown
					label="Selecione uma opção de filtro..."
					options={options}
					inputAttrs={{
						onChange: (event) => {
							this.setState(
								{ selectedOption: event.target.value },
								this.fetchStats
							);
						},
					}}
				/>
				<Spacer vertical={40} />
				<Dropdown
					label="Selecione um usuário para filtro..."
					options={this.state.userList}
					inputAttrs={{
						onChange: (event) => {
							this.setState(
								{ userId: event.target.value },
								this.fetchStats
							);
						},
					}}
				/>
				<Spacer vertical={40} />
				<Row>
					<TextField
						label="Data Inicial"
						inputAttrs={{
							type: "date",
							onChange: (event) => {
								this.setState(
									{
										initDate: new Date(
											event.target.value + "T00:00:00"
										),
									},
									this.fetchStats
								);
							},
						}}
					/>
					<Spacer horizontal={40} />
					<TextField
						label="Data Final"
						inputAttrs={{
							type: "date",
							onChange: (event) => {
								this.setState(
									{
										endDate: new Date(
											event.target.value + "T00:00:00"
										),
									},
									this.fetchStats
								);
							},
						}}
					/>
				</Row>
				<Spacer vertical={20} />
				<div className={classes["statsGeneral-grid"]}>
					{this.state.statItems.length > 0
						? this.state.statItems.map((item: any, index) => (
								<Card key={index}>
									{item.displayName}
									<br />
									<Spacer vertical={10} />
									Quantidade de visualizações:{" "}
									<strong>{item.viewCount}</strong>
								</Card>
						  ))
						: "Nenhuma estatística a ser exibida."}
				</div>
			</div>
		);
	}
}

export default StatsGeneral;
