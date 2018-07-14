"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});
exports["default"] = SumOfMultiples;

function SumOfMultiples(multiples) {
    return {
        to: function to(max) {
            var sum = 0;

            var _loop = function (i) {
                if (multiples.find(function (m) {
                    return i % m === 0;
                })) sum += i;
            };

            for (var i = 1; i < max; i++) {
                _loop(i);
            }

            return sum;
        }
    };
}

module.exports = exports["default"];