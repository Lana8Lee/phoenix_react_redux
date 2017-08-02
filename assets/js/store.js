// @flow

import MainReducer from "./reducers";
import { Model } from "./types";
import { createStore, applyMiddleware, compose } from "redux";
import thunk from "redux-thunk";

const init = new Model();

function composeWithApplyMiddlewares() {
    if (window.__REDUX_DEVTOOLS_EXTENSION__) {
        return compose(
                applyMiddleware(thunk),
                window.__REDUX_DEVTOOLS_EXTENSION__()
                );
    }
    return compose(applyMiddleware(thunk));
}

const createMyStore = (model: Model = init) => {
    return createStore(MainReducer, model,
            composeWithApplyMiddlewares());
};

export default createMyStore(init);
