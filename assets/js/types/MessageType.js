// @flow

import { Record } from "immutable";

export default class MessageType
    extends Record({
        text: ""
    }) {
    text: string;
}
