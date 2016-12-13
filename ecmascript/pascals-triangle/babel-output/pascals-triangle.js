"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Triangle = (function () {
    function Triangle(size) {
        _classCallCheck(this, Triangle);

        this.size = size;
    }

    _createClass(Triangle, [{
        key: "row",
        value: function row(n) {
            var digits = [1];
            var column = 1;

            for (var j = 1; j < n; j++) {
                column = column * (n - j) / j;
                digits.push(column);
            }

            return digits;
        }
    }, {
        key: "rows",
        get: function get() {
            var acc = [];

            for (var i = 1; i <= this.size; i++) {
                acc.push(this.row(i));
            }return acc;
        }
    }, {
        key: "lastRow",
        get: function get() {
            return this.row(this.size);
        }
    }]);

    return Triangle;
})();

exports["default"] = Triangle;
module.exports = exports["default"];