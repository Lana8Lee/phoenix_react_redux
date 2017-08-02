import React from "react";
import { render } from "react-dom";
import { createStore } from "redux";
import { Provider } from "react-redux";
import App from "./containers/App";
import reducers from "./reducers";
import MyStore from "./store";

render(
        <Provider store={MyStore}>
            <App />
        </Provider>,
        document.getElementById("root")
        );
