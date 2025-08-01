const {
	CognitoIdentityProviderClient,
	forgot_passwordCommand,
	InitiateAuthCommand,
	ConfirmSignUpCommand,
} = require('@aws-sdk/client-cognito-identity-provider');
const mongoose = require('mongoose');

const client = new CognitoIdentityProviderClient();

CLIENT_ID = process.env.CLIENT_ID;

exports.lambda_handler = async (event) => {
	console.log(event);

	const email = event['email'];
	const phone_number = event['phone_number'];
	const code = event['code'];
	const NewPassword = event['NewPassword'];
	const role = event['role'];

	const _forgot_passwordresp = signup(email, phone_number, NewPassword);
	console.log(forgot_password_resp);
	return {
		statusCode: 200,
		body: JSON.stringify(resp),
	};
};

// await connectToDatabase();

const signup = async (email, password, first_name, role) => {
	const input = {
		ClientId: CLIENT_ID,
		Username: email,
		Password: NewPassword,
		UserAttributes: [
			{ Name: 'email', Value: email },
			{ Name: 'given_name', Value: first_name },
		],
	};
	const command = new forgot_passwordCommand(input);
	const resp = await client.send(command);

	return resp;
	// console.log(resp);
};

const forgot_password = async (email, password) => {
	const command = new InitiateAuthCommand({
		AuthFlow: 'USER_PASSWORD_AUTH',
		AuthParameters: {
			USERNAME: email,
			PASSWORD: password,
		},
		ClientId: '2nbsjsg02lnu9rmd3qnti127mg',
	});

	const resp = await client.send(command);
};

const confirm_signup = async () => {
	const input = {
		// ConfirmSignUpRequest
		ClientId: 'STRING_VALUE', // required
		SecretHash: 'STRING_VALUE',
		Username: 'STRING_VALUE', // required
		ConfirmationCode: 'STRING_VALUE', // required
		ForceAliasCreation: true || false,
		AnalyticsMetadata: {
			// AnalyticsMetadataType
			AnalyticsEndpointId: 'STRING_VALUE',
		},
		UserContextData: {
			// UserContextDataType
			IpAddress: 'STRING_VALUE',
			EncodedData: 'STRING_VALUE',
		},
		ClientMetadata: {
			// ClientMetadataType
			'<keys>': 'STRING_VALUE',
		},
		Session: 'STRING_VALUE',
	};
	const command = new ConfirmSignUpCommand(input);
	const response = await client.send(command);
};

async function connectToDatabase() {
	if (cachedDb) return cachedDb;

	const uri = process.env.MONGODB_URI;
	const client = await mongoose.connect(uri, {
		useNewUrlParser: true,
		useUnifiedTopology: true,
	});

	cachedDb = client;
	return client;
}