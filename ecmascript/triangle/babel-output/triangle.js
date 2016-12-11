'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Triangle = (function () {
    function Triangle(x, y, z) {
        _classCallCheck(this, Triangle);

        this.x = x;
        this.y = y;
        this.z = z;
    }

    _createClass(Triangle, [{
        key: 'kind',
        value: function kind() {
            if (this.isInvalid()) throw new Error('Invalid triangle');

            if (this.isEquilateral()) return 'equilateral';
            if (this.isIsosceles()) return 'isosceles';

            return 'scalene';
        }
    }, {
        key: 'hasZeroSides',
        value: function hasZeroSides() {
            return this.x === 0 && this.y === 0 && this.z === 0;
        }
    }, {
        key: 'hasNegativeSide',
        value: function hasNegativeSide() {
            return this.x < 0 || this.y < 0 || this.z < 0;
        }
    }, {
        key: 'violatesTriangleEquality',
        value: function violatesTriangleEquality() {
            return this.x + this.y <= this.z || this.x + this.z <= this.y || this.y + this.z <= this.x;
        }
    }, {
        key: 'isInvalid',
        value: function isInvalid() {
            return this.hasZeroSides() || this.hasNegativeSide() || this.violatesTriangleEquality();
        }
    }, {
        key: 'isEquilateral',
        value: function isEquilateral() {
            return this.x === this.y && this.y === this.z;
        }
    }, {
        key: 'isIsosceles',
        value: function isIsosceles() {
            return this.x === this.y || this.y === this.z || this.x === this.z;
        }
    }]);

    return Triangle;
})();

exports['default'] = Triangle;
module.exports = exports['default'];