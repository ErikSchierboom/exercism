'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Converter = (function () {
    function Converter() {
        _classCallCheck(this, Converter);
    }

    _createClass(Converter, [{
        key: 'convert',
        value: function convert(inputDigits, inputBase, outputBase) {
            if (this.invalidBase(inputBase)) {
                throw new Error('Wrong input base');
            }
            if (this.invalidBase(outputBase)) {
                throw new Error('Wrong output base');
            }
            if (this.invalidInputDigits(inputDigits, inputBase)) {
                throw new Error('Input has wrong format');
            }

            return this.toDigits(outputBase, this.fromDigits(inputBase, inputDigits));
        }
    }, {
        key: 'invalidBase',
        value: function invalidBase(base) {
            return base < 2 || !this.isInt(base);
        }
    }, {
        key: 'isInt',
        value: function isInt(number) {
            return number % 1 === 0;
        }
    }, {
        key: 'invalidInputDigits',
        value: function invalidInputDigits(inputDigits, inputBase) {
            if (inputDigits.length === 0) {
                return true;
            }

            if (inputDigits.length === 1) {
                return inputDigits[0] < 0;
            }

            if (inputDigits[0] === 0) {
                return true;
            }

            return inputDigits.findIndex(function (digit) {
                return digit < 0 || digit >= inputBase;
            }) !== -1;
        }
    }, {
        key: 'fromDigits',
        value: function fromDigits(inputBase, inputDigitis) {
            var result = 0;

            var _iteratorNormalCompletion = true;
            var _didIteratorError = false;
            var _iteratorError = undefined;

            try {
                for (var _iterator = inputDigitis[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
                    var fromDigit = _step.value;

                    result = result * inputBase + fromDigit;
                }
            } catch (err) {
                _didIteratorError = true;
                _iteratorError = err;
            } finally {
                try {
                    if (!_iteratorNormalCompletion && _iterator['return']) {
                        _iterator['return']();
                    }
                } finally {
                    if (_didIteratorError) {
                        throw _iteratorError;
                    }
                }
            }

            return result;
        }
    }, {
        key: 'toDigits',
        value: function toDigits(outputBase, decimal) {
            if (decimal === 0) {
                return [0];
            }

            var digits = [];
            var remainder = decimal;
            var multiplier = 1;

            while (remainder > 0) {
                multiplier *= outputBase;

                var value = remainder % multiplier;
                var digit = value / (multiplier / outputBase);

                digits.push(digit);
                remainder -= value;
            }

            return digits.reverse();
        }
    }]);

    return Converter;
})();

exports['default'] = Converter;
module.exports = exports['default'];