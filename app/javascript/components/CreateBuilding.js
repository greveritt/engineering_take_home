import React from 'react';
import { redirect } from 'react-router-dom';
import BuildingForm from './BuildingForm';
import { createBuilding } from '../lib/buildings';

export async function createAction({ request, params }) {
  const formData = await request.formData();
  const attributes = Object.fromEntries(formData);
  await createBuilding(params.clientId, attributes);
  return redirect(`/clients/${params.clientId}`);
}

const CreateBuilding = () => {
  return (
    <>
      <BuildingForm />
    </>
  );
};

export default CreateBuilding;
