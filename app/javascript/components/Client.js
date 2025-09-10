import React from 'react';
import { Link, useLoaderData } from 'react-router-dom';

const Client = ({ children }) => {
  const client = useLoaderData();

  // return (
  //   <Suspense fallback={<p>Loading contact...</p>}>
  //     <Await resolve={client}>
  //       <ul id="client-summary">
  //         <li>ID: {client.id}</li>
  //         <li>Name: {client.name}</li>
  //         <li>Created at: {client.created_at}</li>
  //         <li>Updated at: {client.updated_at}</li>
  //       </ul>
  //     </Await>
  //     {children}
  //   </Suspense>
  // );
  return (
    <>
      <ul id="client-summary">
        <li>ID: {client.id}</li>
        <li>Name: {client.name}</li>
        <li>Created at: {client.created_at}</li>
        <li>Updated at: {client.updated_at}</li>
      </ul>

      <Link to={`/clients/${client.id}/buildings`}>Add a building</Link>
      {children}
    </>
  );
};

export default Client;
