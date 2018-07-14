'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _slicedToArray = (function () { function sliceIterator(arr, i) { var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i['return']) _i['return'](); } finally { if (_d) throw _e; } } return _arr; } return function (arr, i) { if (Array.isArray(arr)) { return arr; } else if (Symbol.iterator in Object(arr)) { return sliceIterator(arr, i); } else { throw new TypeError('Invalid attempt to destructure non-iterable instance'); } }; })();

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Direction = {
    north: 'north',
    east: 'east',
    south: 'south',
    west: 'west'
};

var Robot = (function () {
    function Robot() {
        _classCallCheck(this, Robot);

        this.direction = Direction.north;
        this.coords = [0, 0];
    }

    _createClass(Robot, [{
        key: 'orient',
        value: function orient(direction) {
            this.bearing = direction;
        }
    }, {
        key: 'at',
        value: function at(x, y) {
            this.coordinates = [x, y];
        }
    }, {
        key: 'place',
        value: function place(_ref) {
            var x = _ref.x;
            var y = _ref.y;
            var direction = _ref.direction;

            this.at(x, y);
            this.orient(direction);
        }
    }, {
        key: 'turnRight',
        value: function turnRight() {
            switch (this.bearing) {
                case Direction.north:
                    this.bearing = Direction.east;
                    break;
                case Direction.east:
                    this.bearing = Direction.south;
                    break;
                case Direction.south:
                    this.bearing = Direction.west;
                    break;
                case Direction.west:
                    this.bearing = Direction.north;
                    break;
            }
        }
    }, {
        key: 'turnLeft',
        value: function turnLeft() {
            switch (this.bearing) {
                case Direction.north:
                    this.bearing = Direction.west;
                    break;
                case Direction.east:
                    this.bearing = Direction.north;
                    break;
                case Direction.south:
                    this.bearing = Direction.east;
                    break;
                case Direction.west:
                    this.bearing = Direction.south;
                    break;
            }
        }
    }, {
        key: 'advance',
        value: function advance() {
            var _coordinates = _slicedToArray(this.coordinates, 2);

            var x = _coordinates[0];
            var y = _coordinates[1];

            switch (this.bearing) {
                case Direction.north:
                    this.coordinates = [x, y + 1];
                    break;
                case Direction.east:
                    this.coordinates = [x + 1, y];
                    break;
                case Direction.south:
                    this.coordinates = [x, y - 1];
                    break;
                case Direction.west:
                    this.coordinates = [x - 1, y];
                    break;
            }
        }
    }, {
        key: 'instructions',
        value: function instructions(input) {
            var _this = this;

            return [].concat(_toConsumableArray(input)).map(function (instruction) {
                return _this.getInstruction(instruction);
            });
        }
    }, {
        key: 'getInstruction',
        value: function getInstruction(instruction) {
            switch (instruction) {
                case 'L':
                    return 'turnLeft';
                case 'R':
                    return 'turnRight';
                case 'A':
                    return 'advance';
                default:
                    throw new Error('Invalid instruction');
            }
        }
    }, {
        key: 'evaluate',
        value: function evaluate(instructions) {
            var _this2 = this;

            [].concat(_toConsumableArray(instructions)).map(function (instruction) {
                return _this2.evaluateInstruction(instruction);
            });
        }
    }, {
        key: 'evaluateInstruction',
        value: function evaluateInstruction(instruction) {
            switch (instruction) {
                case 'L':
                    this.turnLeft();
                    break;
                case 'R':
                    this.turnRight();
                    break;
                case 'A':
                    this.advance();
                    break;
                default:
                    throw new Error('Invalid instruction');
            }
        }
    }, {
        key: 'bearing',
        get: function get() {
            return this.direction;
        },
        set: function set(value) {
            this.direction = value;
        }
    }, {
        key: 'coordinates',
        get: function get() {
            return this.coords;
        },
        set: function set(value) {
            this.coords = value;
        }
    }]);

    return Robot;
})();

exports['default'] = Robot;
module.exports = exports['default'];