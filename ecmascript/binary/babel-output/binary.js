'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Binary = (function () {
    function Binary(binary) {
        _classCallCheck(this, Binary);

        this.digits = /^[01]*$/.test(binary) ? [].concat(_toConsumableArray(binary)) : [];
    }

    _createClass(Binary, [{
        key: 'toDecimal',
        value: function toDecimal() {
            var _this = this;

            return this.digits.reduce(function (acc, c) {
                return acc * 2 + _this.charToDecimal(c);
            }, 0);
        }
    }, {
        key: 'charToDecimal',
        value: function charToDecimal(c) {
            return c - '0';
        }
    }]);

    return Binary;
})();

exports['default'] = Binary;
module.exports = exports['default'];