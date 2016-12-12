"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

Array.prototype.isSorted = function () {
    for (var i = 0; i < this.length - 2; i++) {
        if (this[i] > this[i + 1]) return false;
    }

    return true;
};

var BinarySearch = (function () {
    function BinarySearch(input) {
        _classCallCheck(this, BinarySearch);

        this._array = input.isSorted() ? input : undefined;
    }

    _createClass(BinarySearch, [{
        key: "indexOf",
        value: function indexOf(value) {
            if (this.array.length === 0) return -1;

            return this.indexOfRange(value, 0, this.array.length - 1);
        }
    }, {
        key: "indexOfRange",
        value: function indexOfRange(value, minIndex, maxIndex) {
            var middleIndex = Math.round((minIndex + maxIndex) / 2);

            if (this.array[middleIndex] == value) return middleIndex;

            if (middleIndex <= 0 || middleIndex >= this.array.length - 1 || middleIndex < minIndex) return -1;

            if (this.array[middleIndex] > value) return this.indexOfRange(value, minIndex, middleIndex - 1);

            return this.indexOfRange(value, middleIndex + 1, maxIndex);
        }
    }, {
        key: "array",
        get: function get() {
            return this._array;
        }
    }]);

    return BinarySearch;
})();

exports["default"] = BinarySearch;
module.exports = exports["default"];