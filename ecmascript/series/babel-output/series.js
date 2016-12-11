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

        this._digits = [].concat(_toConsumableArray(input)).map(function (x) {
            return x - '0';
        });
    }

    _createClass(Series, [{
        key: 'slices',
        value: function slices(size) {
            if (size > this.digits.length) throw new Error('Slice size is too big.');

            var result = [];

            for (var i = 0; i <= this.digits.length - size; i++) {
                result.push(this.digits.slice(i, i + size));
            }

            return result;
        }
    }, {
        key: 'digits',
        get: function get() {
            return this._digits;
        }
    }]);

    return Series;
})();

exports['default'] = Series;
module.exports = exports['default'];