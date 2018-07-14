"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

var marked0$0 = [range].map(regeneratorRuntime.mark);

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function range(begin, end) {
    var i;
    return regeneratorRuntime.wrap(function range$(context$1$0) {
        while (1) switch (context$1$0.prev = context$1$0.next) {
            case 0:
                i = begin;

            case 1:
                if (!(i <= end)) {
                    context$1$0.next = 7;
                    break;
                }

                context$1$0.next = 4;
                return i;

            case 4:
                i++;
                context$1$0.next = 1;
                break;

            case 7:
            case "end":
                return context$1$0.stop();
        }
    }, marked0$0[0], this);
}

function square(x) {
    return x * x;
}

Array.prototype.sum = function () {
    return this.reduce(function (x, y) {
        return x + y;
    }, 0);
};

var Squares = (function () {
    function Squares(n) {
        _classCallCheck(this, Squares);

        this.n = n;
    }

    // let square x = x * x

    // let squareOfSums (number: int) = [1..number] |> List.sum |> square
    // let sumOfSquares (number: int) = [1..number] |> List.map square |> List.sum
    // let difference (number: int) = squareOfSums number - sumOfSquares number

    _createClass(Squares, [{
        key: "squareOfSums",
        get: function get() {
            return square([].concat(_toConsumableArray(range(1, this.n))).sum());
        }
    }, {
        key: "sumOfSquares",
        get: function get() {
            return [].concat(_toConsumableArray(range(1, this.n))).map(square).sum();
        }
    }, {
        key: "difference",
        get: function get() {
            return this.squareOfSums - this.sumOfSquares;
        }
    }]);

    return Squares;
})();

exports["default"] = Squares;
module.exports = exports["default"];