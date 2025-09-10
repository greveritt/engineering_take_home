import React from 'react';

const ErrorDialog = ({ errors }) => {
  let messages;
  if (errors) {
    messages = typeof errors === "string" ?
      errors :
      <ul id="errors-list">
        {
          messages.map((message) => {
            <li>{message}</li>
          })
        }
      </ul>
  }

  return (
    <div id="errors">
      An error has occurred {messages ? messages : null}
    </div>
  )
};

export default ErrorDialog;
