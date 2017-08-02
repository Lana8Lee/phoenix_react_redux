// @flow
import { Model, MessageType } from "./types";
import { List } from "immutable";
import { combineReducers } from "redux";
const init = new Model();

type ActionType = "SEND_MESSAGE";

function mainReducer(
  model: Model = init,
  action: { type: ActionType, payload: Object }
) {
  switch (action.type) {
    case "SEND_MESSAGE":
      return sendMessage(model, action.payload);
    default:
      return model;
  }
}

function sendMessage(model, payload) {
  if (payload) {
    return model.updateIn(["messages"], messages => {
      return messages.push(new MessageType({ text: payload.message }));
    });
  } else {
    return model;
  }
}

const phoenixApp = combineReducers({
  chat: mainReducer
});

export default phoenixApp;
