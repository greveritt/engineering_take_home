import React from 'react';
import { useLoaderData, redirect } from 'react-router-dom';
import BuildingForm from './BuildingForm';
import { updateBuilding } from '../lib/buildings';

export async function updateAction({ request, params }) {
  const formData = await request.formData();
  const attributes = Object.fromEntries(formData);
  await updateBuilding(params.buildingId, params.clientId, attributes);
  return redirect(`/clients/${params.clientId}/buildings/${params.buildingId}`);
}

const Building = () => {
  const building = useLoaderData();

  return (
    <>
      <BuildingForm building={building} />
    </>
  );
};

export default Building;
