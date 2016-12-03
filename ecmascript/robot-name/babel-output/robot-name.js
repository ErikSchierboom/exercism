"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min;
}

Array.prototype.random = function () {
    return this[getRandomInt(0, this.length)];
};

var generatedNames = new Set();

function randomLetter() {
    var letters = [].concat(_toConsumableArray("ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
    return letters.random();
}

function randomDigit() {
    var digits = [].concat(_toConsumableArray("0123456789"));
    return digits.random();
}

function randomName() {
    var _again = true;

    _function: while (_again) {
        _again = false;

        var name = "" + randomLetter() + randomLetter() + randomDigit() + randomDigit() + randomDigit();

        if (generatedNames.has(name)) {
            _again = true;
            name = undefined;
            continue _function;
        }

        generatedNames.add(name);
        return name;
    }
}

var Robot = (function () {
    function Robot() {
        _classCallCheck(this, Robot);

        this._name = '';
        this.reset();
    }

    _createClass(Robot, [{
        key: "reset",
        value: function reset() {
            this._name = randomName();
        }
    }, {
        key: "name",
        get: function get() {
            return this._name;
        }
    }]);

    return Robot;
})();

exports["default"] = Robot;
module.exports = exports["default"];