import { ApolloClient, InMemoryCache } from '@apollo/client';

const client = new ApolloClient({
  uri: 'https:localhost:3001/graphql',
  cache: new InMemoryCache(),
});

export default client;
