import { BASE_URL } from "./constants";

const defaultHeaders = {
  "Content-Type": "application/json"
};

export async function updateBuilding(id, clientId, attributes) {
  fetch(
    `${BASE_URL}/clients/${clientId}/buildings/${id}.json`,
    {
      method: "PATCH",
      headers: defaultHeaders,
      body: JSON.stringify(attributes)
    }
  );
}

export async function createBuilding(clientId, attributes) {
  fetch(
    `${BASE_URL}/clients/${clientId}/buildings`,
    {
      method: "POST",
      headers: defaultHeaders,
      body: JSON.stringify(attributes)
    }
  );
}
