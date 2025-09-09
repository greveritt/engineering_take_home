// Entry point for the build script in your package.json
import React from 'react';
import ReactDOM from 'react-dom/client';
import {
  createBrowserRouter,
  RouterProvider,
} from 'react-router-dom';
import { BASE_URL } from './lib/constants';
import Building, { updateAction } from './components/Building';
import CreateBuilding, { createAction } from './components/CreateBuilding';
import GlobalBuildingList from './components/GlobalBuildingList';
import Client from './components/Client';
import ClientSelect from './components/ClientSelect';
import BuildingForm from './components/BuildingForm';

const clientBuildingLoader = ({ params }) => {
  return fetch(`${BASE_URL}/clients/${params.clientId}/buildings/${params.buildingId}.json`);
};

const router = createBrowserRouter([
  {
    path: '/',
    element: <ClientSelect />,
    loader: () => {
      return fetch(`${BASE_URL}/clients.json`);
    }
  },
  {
    path: '/clients/:clientId',
    element: <Client />,
    loader: ({ params }) => {
      // return defer(fetch(`${BASE_URL}/clients/${params.clientId}.json`));
      return fetch(`${BASE_URL}/clients/${params.clientId}.json`);
    },
    // children: [
    //   {
    //     path: '/clients/:clientId/buildings',
    //     element: <CreateBuilding />,
    //     action: createAction
    //   }
    // ]
    // children: [
    //   {
    //     path: '/buildings',
    //     element: <GlobalBuildingList />,
    //     loader: ({ params }) => {
    //       return fetch(`${BASE_URL}/clients/${params.clientId}/buildings.json`);
    //     }
    //   },
      // {
      //   path: '/buildings/:buildingId',
      //   element: <Building />,
      //   loader: ({ params }) => {
      //     return fetch(`${BASE_URL}/clients/${params.clientId}/buildings/${params.buildingId}.json`);
      //   }
      // }
    // ],
  },
  {
    path: '/clients/:clientId/buildings',
    element: <CreateBuilding />,
    action: createAction
  },
  {
    path: '/clients/:clientId/buildings/:buildingId',
    element: <Building />,
    loader: clientBuildingLoader,
    action: updateAction
  },
  {
    path: '/buildings',
    element: <GlobalBuildingList />,
    loader: () => {
      return fetch(`${BASE_URL}/buildings.json`);
    }
  },
]);

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('react-root');
  if (node) {
    ReactDOM.createRoot(node).render(
      <React.StrictMode>
        <RouterProvider router={router} />
      </React.StrictMode>
    )
  }
});
