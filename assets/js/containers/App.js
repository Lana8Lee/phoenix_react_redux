import React, { Component } from "react";
import { connect } from "react-redux";
import ListMessages from "../components/ListMessages";
import Actions from "../actions";

function App(props) {
  const { messages, sendMessageToChannel } = props;
  let input;
  return (
    <div>
      <ListMessages messages={messages} />
      <input type="text" ref={node => input = node} />
      <button onClick={() => sendMessageToChannel(input.value)}>
        SEND
      </button>
    </div>
  );
}

export const AppContainer = connect(
  function mapStateToProps(state) {
    return {
      messages: state.chat.get("messages")
    };
  },
  function mapDispatchToProps(dispatch) {
    return {
      sendMessageToChannel: message => {
        dispatch(Actions.sendMessage(message));
      }
    };
  }
)(App);

export default AppContainer;
