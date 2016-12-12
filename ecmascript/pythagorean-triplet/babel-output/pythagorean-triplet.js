"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Triplet = (function () {
    function Triplet(x, y, z) {
        _classCallCheck(this, Triplet);

        this.x = x;
        this.y = y;
        this.z = z;
    }

    _createClass(Triplet, [{
        key: "sum",
        value: function sum() {
            return this.x + this.y + this.z;
        }
    }, {
        key: "product",
        value: function product() {
            return this.x * this.y * this.z;
        }
    }, {
        key: "isPythagorean",
        value: function isPythagorean() {
            return this.x * this.x + this.y * this.y === this.z * this.z;
        }
    }], [{
        key: "where",
        value: function where(_ref) {
            var _ref$minFactor = _ref.minFactor;
            var minFactor = _ref$minFactor === undefined ? 1 : _ref$minFactor;
            var _ref$maxFactor = _ref.maxFactor;
            var maxFactor = _ref$maxFactor === undefined ? undefined : _ref$maxFactor;
            var _ref$sum = _ref.sum;
            var sum = _ref$sum === undefined ? undefined : _ref$sum;

            var triplets = [];

            for (var i = minFactor; i < maxFactor - 1; i++) {
                for (var j = i + 1; j < maxFactor; j++) {
                    for (var k = j + 1; k <= maxFactor; k++) {
                        var triplet = new Triplet(i, j, k);
                        if (triplet.isPythagorean() && (sum || triplet.sum()) === triplet.sum()) triplets.push(triplet);
                    }
                }
            }

            return triplets;
        }
    }]);

    return Triplet;
})();

exports["default"] = Triplet;
module.exports = exports["default"];