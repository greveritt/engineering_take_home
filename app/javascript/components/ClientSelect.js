import React from "react";
import { Link, useLoaderData } from "react-router-dom";

const ClientSelect = () => {
  const clients = useLoaderData();

  return(
    <div id="clients">
      {
        clients.map(client => {
          return (<Link id={client.id} key={client.id} to={`clients/${client.id}`}><div className="client-link">{client.name}</div></Link>);
        })
      }
      <Link to="/buildings">View buildings for all clients</Link>
    </div>
  );
};

export default ClientSelect;
