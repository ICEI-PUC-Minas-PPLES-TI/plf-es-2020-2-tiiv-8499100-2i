import React, { FormEvent } from "react";
import Column from "../../layout/column/Column";
import Button from "../../components/button/Button";
import Row from "../../layout/row/Row";
import Spacer from "../../layout/spacer/Spacer";
import TextField from "../../components/text-field/TextField";

type PropsType = {
	onSubmit: (event: FormEvent<HTMLFormElement>) => void;
};

const LoginPage = (props: PropsType) => (
	<form onSubmit={props.onSubmit}>
		<Column align="center">
			<Row>
				<TextField
					label="E-mail"
					inputAttrs={{
						id: "email",
						placeholder: "Exemplo: joao@email.com",
					}}
				/>
			</Row>
			<Spacer vertical={40} />
			<Row>
				<TextField
					label="Senha"
					inputAttrs={{
						id: "password",
						type: "password",
						placeholder: "A senha tem no mínimo 8 caracteres",
					}}
				/>
			</Row>
			<Spacer vertical={40} />
			<Button
				label="Fazer Login"
				size="big"
				buttonAttrs={{
					type: "submit",
				}}
			/>
		</Column>
	</form>
);

export default LoginPage;
