import React from 'react';
import { Form } from 'react-router-dom';

const BuildingForm = ({ building }) => {
  return (
    <Form method="post" id="building-form">
      <label>
        <span>address1</span>
        <input
          type="text"
          name="address1"
          aria-label="address1"
          placeholder="address1"
          defaultValue={building?.address1}
        />
      </label>
      <label>
        <span>address2</span>
        <input
          type="text"
          name="address2"
          aria-label="address2"
          placeholder="address2"
          defaultValue={building?.address2}
        />
      </label>
      <label>
        <span>city</span>
        <input
          type="text"
          name="city"
          aria-label="city"
          placeholder="city"
          defaultValue={building?.city}
        />
      </label>
      <label>
        <span>state</span>
        <input
          type="text"
          name="state"
          aria-label="state"
          placeholder="state"
          defaultValue={building?.state}
        />
      </label>
      <label>
        <span>zip</span>
        <input
          type="text"
          name="zip"
          aria-label="zip"
          placeholder="zip"
          defaultValue={building?.zip}
        />
      </label>
      <button type="submit">Submit</button>
    </Form>
  );
};

export default BuildingForm;
