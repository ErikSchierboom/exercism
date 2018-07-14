'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

Array.prototype.distinct = function () {
    return this.filter(function (v, i, a) {
        return a.indexOf(v) === i;
    });
};

var CustomSet = (function () {
    function CustomSet() {
        var data = arguments.length <= 0 || arguments[0] === undefined ? [] : arguments[0];

        _classCallCheck(this, CustomSet);

        this._data = data.distinct().sort();
    }

    _createClass(CustomSet, [{
        key: 'put',
        value: function put(value) {
            return new CustomSet(this.data.concat([value]));
        }
    }, {
        key: 'member',
        value: function member(value) {
            return this.data.indexOf(value) !== -1;
        }
    }, {
        key: 'delete',
        value: function _delete(value) {
            if (!this.member(value)) return new CustomSet(this.data);

            var copy = this.data.slice(0);
            copy.splice(this.data.indexOf(value), 1);
            return new CustomSet(copy);
        }
    }, {
        key: 'eql',
        value: function eql(other) {
            return this.data.join('|') === other.data.join('|');
        }
    }, {
        key: 'union',
        value: function union(other) {
            return new CustomSet(this.data.concat(other.data));
        }
    }, {
        key: 'intersection',
        value: function intersection(other) {
            return new CustomSet(this.data.filter(function (x) {
                return other.member(x);
            }));
        }
    }, {
        key: 'difference',
        value: function difference(other) {
            return new CustomSet(this.data.filter(function (x) {
                return !other.member(x);
            }));
        }
    }, {
        key: 'disjoint',
        value: function disjoint(other) {
            var _this = this;

            return other.data.every(function (x) {
                return !_this.member(x);
            });
        }
    }, {
        key: 'subset',
        value: function subset(other) {
            var _this2 = this;

            return other.data.every(function (x) {
                return _this2.member(x);
            });
        }
    }, {
        key: 'sort',
        value: function sort() {
            return this;
        }
    }, {
        key: 'size',
        value: function size() {
            return this.data.length;
        }
    }, {
        key: 'toList',
        value: function toList() {
            return this.data;
        }
    }, {
        key: 'empty',
        value: function empty() {
            return new CustomSet();
        }
    }, {
        key: 'data',
        get: function get() {
            return this._data;
        }
    }]);

    return CustomSet;
})();

exports['default'] = CustomSet;
module.exports = exports['default'];