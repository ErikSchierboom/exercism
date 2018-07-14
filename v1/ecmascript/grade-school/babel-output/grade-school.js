"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var School = (function () {
    function School() {
        _classCallCheck(this, School);

        this._roster = {};
    }

    _createClass(School, [{
        key: "roster",
        value: function roster() {
            return this.clone(this._roster);
        }
    }, {
        key: "add",
        value: function add(student, grade) {
            if (!this._roster.hasOwnProperty(grade)) {
                this._roster[grade] = [];
            }

            this._roster[grade].push(student);
            this._roster[grade].sort();
        }
    }, {
        key: "grade",
        value: function grade(value) {
            if (this._roster.hasOwnProperty(value)) {
                return this.clone(this._roster[value].slice(0));
            }

            return [];
        }
    }, {
        key: "clone",
        value: function clone(a) {
            return JSON.parse(JSON.stringify(a));
        }
    }]);

    return School;
})();

exports["default"] = School;
module.exports = exports["default"];