import { GraphQLClient } from "graphql-request";
import { getSdk, LoginMutationVariables } from "./generated/types";

async function login({ email, password }: LoginMutationVariables) {
  const client = new GraphQLClient("http://localhost:3000/graphql");
  const sdk = getSdk(client);

  const query = await sdk.login({ email, password });

  if (query.login.__typename === "AuthenticatedUser") {
    console.log("Successfully signed in");
  } else {
    console.log(query.login.error);
  }
}

login({
  email: "daniel@gmail.com",
  password: "Taco1234",
});
