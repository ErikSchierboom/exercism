'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Luhn = (function () {
    function Luhn(number) {
        _classCallCheck(this, Luhn);

        this._addends = this.getAddends(number);
    }

    _createClass(Luhn, [{
        key: 'getAddends',
        value: function getAddends(number) {
            var addends = [];
            var digits = [].concat(_toConsumableArray(number.toString())).map(function (c) {
                return c - '0';
            });

            for (var i = 0; i < digits.length; i++) {
                addends.push(this.getDigitValue(digits[digits.length - i - 1], i));
            }return addends.reverse();
        }
    }, {
        key: 'getDigitValue',
        value: function getDigitValue(digit, index) {
            if (index % 2 == 0) return digit;

            var doubledValue = digit * 2;
            return doubledValue > 9 ? doubledValue - 9 : doubledValue;
        }
    }, {
        key: 'checkDigit',
        get: function get() {
            return this.addends[this.addends.length - 1];
        }
    }, {
        key: 'checksum',
        get: function get() {
            return this.addends.reduce(function (x, y) {
                return x + y;
            }, 0);
        }
    }, {
        key: 'addends',
        get: function get() {
            return this._addends;
        }
    }, {
        key: 'valid',
        get: function get() {
            return this.checksum % 10 === 0;
        }
    }], [{
        key: 'create',
        value: function create(number) {
            var targetNumber = number * 10;

            var luhn = new Luhn(targetNumber);

            if (!luhn.valid) targetNumber += 10 - luhn.checksum % 10;

            return targetNumber;
        }
    }]);

    return Luhn;
})();

exports['default'] = Luhn;
module.exports = exports['default'];