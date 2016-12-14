'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

Array.prototype.equals = function (other) {
    return JSON.stringify(this) === JSON.stringify(other);
};

Array.prototype.chunks = function (size) {
    var chunks = [];

    for (var i = 0; i < this.length; i += size) {
        chunks.push(this.slice(i, i + size));
    }return chunks;
};

var digitPartPatterns = {
    'S': [' ', ' ', ' '],
    'B': [' ', '_', ' '],
    'L': ['|', ' ', ' '],
    'R': [' ', ' ', '|'],
    'BL': ['|', '_', ' '],
    'BR': [' ', '_', '|'],
    'LR': ['|', ' ', '|'],
    'LRB': ['|', '_', '|']
};

var digitRowPatterns = ["B LR LRB S", "S R R S", "B BR BL S", "B BR BR S", "S LRB R S", "B BL BR S", "B BL LRB S", "B R R S", "B LRB LRB S", "B LRB BR S"];

function digitPattern(digit) {
    var x = digitRowPatterns[digit].split(' ');
    var y = x.map(function (p) {
        return digitPartPatterns[p];
    });
    return y;
}

function parseNumber(lines) {
    for (var digit = 0; digit <= 9; digit++) {
        if (lines.equals(digitPattern(digit))) return digit.toString();
    }

    return '?';
}

var Ocr = (function () {
    function Ocr() {
        _classCallCheck(this, Ocr);
    }

    _createClass(Ocr, [{
        key: 'convert',
        value: function convert(input) {
            var rows = this.parseRows(input);
            return rows.map(function (row) {
                return row.map(parseNumber).join('');
            }).join(',');
        }
    }, {
        key: 'parseRows',
        value: function parseRows(input) {
            var _this = this;

            return input.split('\n').map(function (x) {
                return [].concat(_toConsumableArray(x));
            }).chunks(4).map(function (row) {
                return _this.parseRow(row);
            });
        }
    }, {
        key: 'parseRow',
        value: function parseRow(row) {
            var digits = [];

            for (var i = 0; i < row[0].length; i += 3) {
                digits.push(this.parseDigit(row, i));
            }return digits;
        }
    }, {
        key: 'parseDigit',
        value: function parseDigit(row, index) {
            var digit = [];

            for (var i = 0; i < 4; i++) {
                digit.push(row[i].slice(index, index + 3));
            }return digit;
        }
    }]);

    return Ocr;
})();

exports['default'] = Ocr;
module.exports = exports['default'];