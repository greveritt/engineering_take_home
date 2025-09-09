import React from 'react';
import { useLoaderData } from 'react-router-dom';

const Client = () => {
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
    </>
  );
};

export default Client;
