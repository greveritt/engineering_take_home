// Entry point for the build script in your package.json
import React from 'react';
import ReactDOM from 'react-dom/client';
import {
  createBrowserRouter,
  RouterProvider,
} from 'react-router-dom';
import { BASE_URL } from './lib/constants';
import GlobalBuildingList from './components/GlobalBuildingList';
import Client from './components/Client';
import ClientSelect from './components/ClientSelect';

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
    //     path: '/buildings',
    //     element: <GlobalBuildingList />,
    //     loader: ({ params }) => {
    //       return fetch(`${BASE_URL}/clients/${params.clientId}/buildings.json`);
    //     }
    //   },
    //   {
    //     path: '/buildings/:buildingId',
    //     element: <Building />,
    //     loader: ({ params }) => {
    //       return fetch(`${BASE_URL}/clients/${params.clientId}/buildings/${params.buildingId}.json`);
    //     }
    //   }
    // ],
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
