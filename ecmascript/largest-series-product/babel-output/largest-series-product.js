'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Series = (function () {
    function Series(input) {
        _classCallCheck(this, Series);

        if (!/^\d*$/.test(input)) throw new Error('Invalid input.');

        this.digits = [].concat(_toConsumableArray(input)).map(function (char) {
            return char - '0';
        });
    }

    _createClass(Series, [{
        key: 'largestProduct',
        value: function largestProduct(max) {
            var _this = this;

            if (max < 0) throw new Error('Invalid input.');
            if (max > this.digits.length) throw new Error('Slice size is too big.');

            return [].concat(_toConsumableArray(this.slices(max))).map(function (slice) {
                return _this.product(slice);
            }).reduce(function (x, y) {
                return Math.max(x, y);
            }, 0);
        }
    }, {
        key: 'product',
        value: function product(slice) {
            return slice.reduce(function (x, y) {
                return x * y;
            }, 1);
        }
    }, {
        key: 'slices',
        value: regeneratorRuntime.mark(function slices(size) {
            var i;
            return regeneratorRuntime.wrap(function slices$(context$2$0) {
                while (1) switch (context$2$0.prev = context$2$0.next) {
                    case 0:
                        i = 0;

                    case 1:
                        if (!(i <= this.digits.length - size)) {
                            context$2$0.next = 7;
                            break;
                        }

                        context$2$0.next = 4;
                        return this.digits.slice(i, i + size);

                    case 4:
                        i++;
                        context$2$0.next = 1;
                        break;

                    case 7:
                    case 'end':
                        return context$2$0.stop();
                }
            }, slices, this);
        })
    }]);

    return Series;
})();

exports['default'] = Series;
module.exports = exports['default'];