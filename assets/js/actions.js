function sendMessage(message) {
  return {
    type: "SEND_MESSAGE",
    payload: {
      message
    }
  };
}

export default { sendMessage };
