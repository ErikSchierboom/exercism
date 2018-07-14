'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Hexadecimal = (function () {
    function Hexadecimal(hexadecimal) {
        _classCallCheck(this, Hexadecimal);

        this.digits = /^[\dabcdef]*$/.test(hexadecimal) ? [].concat(_toConsumableArray(hexadecimal)) : [];
        this.hexadecimalDigits = [].concat(_toConsumableArray('0123456789abcdef'));
    }

    _createClass(Hexadecimal, [{
        key: 'toDecimal',
        value: function toDecimal() {
            var _this = this;

            return this.digits.reduce(function (acc, c) {
                return acc * 16 + _this.charToDecimal(c);
            }, 0);
        }
    }, {
        key: 'charToDecimal',
        value: function charToDecimal(c) {
            return this.hexadecimalDigits.indexOf(c);
        }
    }]);

    return Hexadecimal;
})();

exports['default'] = Hexadecimal;
module.exports = exports['default'];