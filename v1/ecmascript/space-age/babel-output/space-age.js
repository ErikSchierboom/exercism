"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var SpaceAge = (function () {
    function SpaceAge(seconds) {
        _classCallCheck(this, SpaceAge);

        this.seconds = seconds;
    }

    _createClass(SpaceAge, [{
        key: "onMercury",
        value: function onMercury() {
            return this.calculateAge(0.2408467);
        }
    }, {
        key: "onVenus",
        value: function onVenus() {
            return this.calculateAge(0.61519726);
        }
    }, {
        key: "onEarth",
        value: function onEarth() {
            return this.calculateAge(1);
        }
    }, {
        key: "onMars",
        value: function onMars() {
            return this.calculateAge(1.8808158);
        }
    }, {
        key: "onJupiter",
        value: function onJupiter() {
            return this.calculateAge(11.862615);
        }
    }, {
        key: "onSaturn",
        value: function onSaturn() {
            return this.calculateAge(29.447498);
        }
    }, {
        key: "onUranus",
        value: function onUranus() {
            return this.calculateAge(84.016846);
        }
    }, {
        key: "onNeptune",
        value: function onNeptune() {
            return this.calculateAge(164.79132);
        }
    }, {
        key: "calculateAge",
        value: function calculateAge(periodInEarthYears) {
            var earthOrbitInSeconds = 31557600;
            return parseFloat((this.seconds / (earthOrbitInSeconds * periodInEarthYears)).toFixed(2));
        }
    }]);

    return SpaceAge;
})();

exports["default"] = SpaceAge;
module.exports = exports["default"];