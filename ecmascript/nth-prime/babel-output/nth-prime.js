'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

var marked0$0 = [possiblePrimes, primes].map(regeneratorRuntime.mark);

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

function possiblePrimes() {
    var n;
    return regeneratorRuntime.wrap(function possiblePrimes$(context$1$0) {
        while (1) switch (context$1$0.prev = context$1$0.next) {
            case 0:
                n = 6;

            case 1:
                context$1$0.next = 3;
                return n - 1;

            case 3:
                context$1$0.next = 5;
                return n + 1;

            case 5:

                n += 6;

            case 6:
                context$1$0.next = 1;
                break;

            case 8:
            case 'end':
                return context$1$0.stop();
        }
    }, marked0$0[0], this);
}

function primes() {
    var _iteratorNormalCompletion, _didIteratorError, _iteratorError, _iterator, _step, prime;

    return regeneratorRuntime.wrap(function primes$(context$1$0) {
        while (1) switch (context$1$0.prev = context$1$0.next) {
            case 0:
                context$1$0.next = 2;
                return 2;

            case 2:
                context$1$0.next = 4;
                return 3;

            case 4:
                _iteratorNormalCompletion = true;
                _didIteratorError = false;
                _iteratorError = undefined;
                context$1$0.prev = 7;
                _iterator = possiblePrimes()[Symbol.iterator]();

            case 9:
                if (_iteratorNormalCompletion = (_step = _iterator.next()).done) {
                    context$1$0.next = 17;
                    break;
                }

                prime = _step.value;

                if (!isPrime(prime)) {
                    context$1$0.next = 14;
                    break;
                }

                context$1$0.next = 14;
                return prime;

            case 14:
                _iteratorNormalCompletion = true;
                context$1$0.next = 9;
                break;

            case 17:
                context$1$0.next = 23;
                break;

            case 19:
                context$1$0.prev = 19;
                context$1$0.t0 = context$1$0['catch'](7);
                _didIteratorError = true;
                _iteratorError = context$1$0.t0;

            case 23:
                context$1$0.prev = 23;
                context$1$0.prev = 24;

                if (!_iteratorNormalCompletion && _iterator['return']) {
                    _iterator['return']();
                }

            case 26:
                context$1$0.prev = 26;

                if (!_didIteratorError) {
                    context$1$0.next = 29;
                    break;
                }

                throw _iteratorError;

            case 29:
                return context$1$0.finish(26);

            case 30:
                return context$1$0.finish(23);

            case 31:
            case 'end':
                return context$1$0.stop();
        }
    }, marked0$0[1], this, [[7, 19, 23, 31], [24,, 26, 30]]);
}

function isPrime(n) {
    var r = Math.floor(Math.sqrt(n));

    if (r < 5) return true;

    for (var i = 5; i < r + 1; i++) {
        if (n % i === 0) return false;
    }

    return true;
}

var Prime = (function () {
    function Prime() {
        _classCallCheck(this, Prime);
    }

    _createClass(Prime, [{
        key: 'nth',
        value: function nth(n) {
            if (n < 1) throw new Error('Prime is not possible');

            var prime = 0;
            var p = primes();

            for (var i = 0; i < n; i++) {
                prime = p.next().value;
            }return prime;
        }
    }]);

    return Prime;
})();

exports['default'] = Prime;
module.exports = exports['default'];