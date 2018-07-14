"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});
function keep(input, predicate) {
    var matches = [];

    var _iteratorNormalCompletion = true;
    var _didIteratorError = false;
    var _iteratorError = undefined;

    try {
        for (var _iterator = input[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
            var value = _step.value;

            if (predicate(value)) matches.push(value);
        }
    } catch (err) {
        _didIteratorError = true;
        _iteratorError = err;
    } finally {
        try {
            if (!_iteratorNormalCompletion && _iterator["return"]) {
                _iterator["return"]();
            }
        } finally {
            if (_didIteratorError) {
                throw _iteratorError;
            }
        }
    }

    return matches;
}

function discard(input, predicate) {
    return keep(input, function (value) {
        return !predicate(value);
    });
}

exports["default"] = { keep: keep, discard: discard };
module.exports = exports["default"];