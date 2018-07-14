'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

var marked0$0 = [range].map(regeneratorRuntime.mark);

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var _bigInteger = require('./big-integer');

var _bigInteger2 = _interopRequireDefault(_bigInteger);

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
            case 'end':
                return context$1$0.stop();
        }
    }, marked0$0[0], this);
}

var Grains = (function () {
    function Grains() {
        _classCallCheck(this, Grains);
    }

    _createClass(Grains, [{
        key: 'squareBigInt',
        value: function squareBigInt(n) {
            return (0, _bigInteger2['default'])(2).pow(n - 1);
        }
    }, {
        key: 'square',
        value: function square(n) {
            return this.squareBigInt(n).toString();
        }
    }, {
        key: 'total',
        value: function total() {
            var _this = this;

            return [].concat(_toConsumableArray(range(1, 64))).map(function (x) {
                return _this.squareBigInt(x);
            }).reduce(function (x, y) {
                return x.add(y);
            }).toString();
        }
    }]);

    return Grains;
})();

exports['default'] = Grains;
module.exports = exports['default'];