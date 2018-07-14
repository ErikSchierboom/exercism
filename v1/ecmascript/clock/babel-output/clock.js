'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

exports['default'] = at;

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Clock = (function () {
    function Clock(hours, minutes) {
        _classCallCheck(this, Clock);

        this.hours = Math.floor(this.mod((hours * 60 + minutes) / 60.0, 24));
        this.minutes = this.mod(minutes, 60);
    }

    _createClass(Clock, [{
        key: 'plus',
        value: function plus(minutesToAdd) {
            return new Clock(this.hours, this.minutes + minutesToAdd);
        }
    }, {
        key: 'minus',
        value: function minus(minutesToSubtract) {
            return new Clock(this.hours, this.minutes - minutesToSubtract);
        }
    }, {
        key: 'equals',
        value: function equals(other) {
            return this.hours === other.hours && this.minutes === other.minutes;
        }
    }, {
        key: 'toString',
        value: function toString() {
            return this.formatNumber(this.hours) + ':' + this.formatNumber(this.minutes);
        }
    }, {
        key: 'mod',
        value: function mod(x, y) {
            return Math.floor((x % y + y) % y);
        }
    }, {
        key: 'formatNumber',
        value: function formatNumber(x) {
            if (x < 10) return '0' + x;

            return x;
        }
    }]);

    return Clock;
})();

function at(hours) {
    var minutes = arguments.length <= 1 || arguments[1] === undefined ? 0 : arguments[1];

    return new Clock(hours, minutes);
}

module.exports = exports['default'];