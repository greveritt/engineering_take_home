// Entry point for the build script in your package.json
import React from 'react';
import ReactDOM from 'react-dom/client';
import {
  createBrowserRouter,
  RouterProvider,
} from 'react-router-dom';
import { BASE_URL } from './lib/constants';
import Client from './components/Client';
import ClientSelect from './components/ClientSelect';

const router = createBrowserRouter([
  {
    path: '/',
    element: <ClientSelect />,
    loader: ({}) => {
      return fetch(`${BASE_URL}/clients.json`);
    }
  },
  {
    path: '/client/:clientId',
    element: <Client />,
    loader: ({ params }) => {
      // return defer(fetch(`${BASE_URL}/clients/${params.clientId}.json`));
      return fetch(`${BASE_URL}/clients/${params.clientId}.json`);
    }
  }
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
