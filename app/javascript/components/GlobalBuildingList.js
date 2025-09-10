import React from 'react';
import { Link, useLoaderData } from 'react-router-dom';

const GlobalBuildingList = () => {
  const buildings = useLoaderData();

  return (
    <table id="buildings">
      <caption>All buildings</caption>
      <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Street Address</th>
          <th scope="col">Secondary Address</th>
          <th scope="col">City</th>
          <th scope="col">State</th>
          <th scope="col">ZIP code</th>
          <th scope="col">Client</th>
          <th scope="col">Created At</th>
          <th scope="col">Updated At</th>
        </tr>
      </thead>
      <tbody>
        {
          buildings.map(building => {
            return (
              <tr id={`building-${building.id}`} key={`building-${building.id}`}>
                <th scope="row"><Link id={building.id} key={building.id} to={`/clients/${building.client.id}/buildings/${building.id}`}>{building.id}</Link></th>
                <td>{building.address1}</td>
                <td>{building.address2}</td>
                <td>{building.city}</td>
                <td>{building.state}</td>
                <td>{building.zip}</td>
                <td>{building.client.name}</td>
                <td>{building.created_at}</td>
              </tr>
            );
          })
        }
      </tbody>
    </table>
  );
};

export default GlobalBuildingList;
