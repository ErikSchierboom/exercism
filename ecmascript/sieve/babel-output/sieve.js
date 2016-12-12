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

var Sieve = (function () {
    function Sieve(max) {
        _classCallCheck(this, Sieve);

        this.max = max;
    }

    _createClass(Sieve, [{
        key: "excludePrimeMultiples",
        value: function excludePrimeMultiples(possiblePrimes, prime) {
            return possiblePrimes.filter(function (n) {
                return n % prime !== 0;
            });
        }
    }, {
        key: "primes",
        get: function get() {
            var possiblePrimes = [].concat(_toConsumableArray(range(2, this.max)));
            var primes = [];

            while (possiblePrimes.length > 0) {
                var prime = possiblePrimes[0];
                primes.push(prime);

                possiblePrimes = this.excludePrimeMultiples(possiblePrimes, prime);
            }

            return primes;
        }
    }]);

    return Sieve;
})();

exports["default"] = Sieve;
module.exports = exports["default"];