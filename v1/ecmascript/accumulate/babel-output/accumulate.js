"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});
exports["default"] = accumulate;

function accumulate(input, accumulator) {
    return input.map(function (i) {
        return accumulator(i);
    });
}

module.exports = exports["default"];