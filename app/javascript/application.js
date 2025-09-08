// Entry point for the build script in your package.json
import React from 'react';
import ReactDOM from 'react-dom/client';
import {
  createBrowserRouter,
  RouterProvider,
} from 'react-router-dom';
import ClientSelect from './components/ClientSelect';

const baseUrl = 'http://localhost:3000';

const router = createBrowserRouter([
  {
    path: '/',
    element: <ClientSelect />,
    loader: ({}) => {
      return fetch(`${baseUrl}/clients.json`);
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
