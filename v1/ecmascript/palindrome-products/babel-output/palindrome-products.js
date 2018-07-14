"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});
exports["default"] = generate;
function isPalindrome(num) {
    var n = num;
    var rev = 0;
    while (num > 0) {
        var dig = num % 10;
        rev = rev * 10 + dig;
        num = Math.floor(num / 10);
    }

    return n === rev;
}

function generate(_ref) {
    var _ref$minFactor = _ref.minFactor;
    var minFactor = _ref$minFactor === undefined ? 1 : _ref$minFactor;
    var _ref$maxFactor = _ref.maxFactor;
    var maxFactor = _ref$maxFactor === undefined ? Number.MAX_VALUE : _ref$maxFactor;

    var largest = { value: Number.MIN_VALUE, factors: [] };
    var smallest = { value: Number.MAX_VALUE, factors: [] };

    for (var x = minFactor; x <= maxFactor; x++) {
        for (var y = x; y <= maxFactor; y++) {
            var product = x * y;

            if (isPalindrome(product)) {
                if (product >= largest.value) {
                    largest.value = product;
                    largest.factors = [x, y];
                }

                if (product <= smallest.value) {
                    smallest.value = product;
                    smallest.factors = [x, y];
                }
            }
        }
    }

    return { largest: largest, smallest: smallest };
}

module.exports = exports["default"];