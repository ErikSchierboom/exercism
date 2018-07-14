'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Matrix = (function () {
    function Matrix(input) {
        _classCallCheck(this, Matrix);

        this._rows = Matrix.parseRows(input);
        this._columns = Matrix.transpose(this._rows);
    }

    _createClass(Matrix, [{
        key: 'calculateMaxForRows',
        value: function calculateMaxForRows() {
            this.maxRow = [];

            for (var row = 0; row < this.rows.length; row++) {
                this.maxRow[row] = Math.max.apply(Math, _toConsumableArray(this.rows[row]));
            }
        }
    }, {
        key: 'calculateMaxForColumns',
        value: function calculateMaxForColumns() {
            this.minCol = [];

            for (var col = 0; col < this.columns.length; col++) {
                this.minCol[col] = Math.min.apply(Math, _toConsumableArray(this.columns[col]));
            }
        }
    }, {
        key: 'rows',
        get: function get() {
            return this._rows;
        }
    }, {
        key: 'columns',
        get: function get() {
            return this._columns;
        }
    }, {
        key: 'saddlePoints',
        get: function get() {
            this.calculateMaxForRows();
            this.calculateMaxForColumns();

            var points = [];

            for (var row = 0; row < this.rows.length; row++) {
                for (var col = 0; col < this.columns.length; col++) {
                    if (this.rows[row][col] >= this.maxRow[row] && this.rows[row][col] <= this.minCol[col]) points.push([row, col]);
                }
            }

            return points;
        }
    }], [{
        key: 'parseRows',
        value: function parseRows(input) {
            return input.split('\n').map(Matrix.parseRow);
        }
    }, {
        key: 'parseRow',
        value: function parseRow(row) {
            return row.trim().split(' ').map(function (char) {
                return parseInt(char.toString());
            });
        }
    }, {
        key: 'transpose',
        value: function transpose(input) {
            var transposed = [];

            for (var i = 0; i < input.length; i++) {
                for (var j = 0; j < input[i].length; j++) {
                    if (transposed.length <= j) transposed[j] = [];

                    transposed[j].push(input[i][j]);
                }
            }

            return transposed;
        }
    }]);

    return Matrix;
})();

exports['default'] = Matrix;
module.exports = exports['default'];