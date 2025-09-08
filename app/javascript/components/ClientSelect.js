import React from "react";
import { useLoaderData } from "react-router-dom";

const ClientSelect = () => {
  const clients = useLoaderData();

  return(
    <div id="clients">
      {
        clients.map(client => {
          return (<p id={client.id} key={client.id}>{client.name}</p>);
        })
      }
    </div>
  );
};

export default ClientSelect;
