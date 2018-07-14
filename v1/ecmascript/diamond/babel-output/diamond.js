"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

String.prototype.padRight = function (size) {
    var padded = this;

    for (var i = this.length; i < size; i++) {
        padded += ' ';
    }return padded;
};

var Diamond = (function () {
    function Diamond() {
        _classCallCheck(this, Diamond);
    }

    _createClass(Diamond, [{
        key: "makeDiamond",
        value: function makeDiamond(letter) {
            var _this = this;

            var letters = this.getLetters(letter);
            var diamondLetters = letters.concat(letters.slice(0).reverse().slice(1));

            return diamondLetters.map(function (diamondLetter) {
                return _this.makeLine(letters.length, diamondLetter);
            }).join("\n") + "\n";
        }
    }, {
        key: "getLetters",
        value: function getLetters(letter) {
            var letters = [];

            var start = 'A'.charCodeAt();
            var stop = letter.charCodeAt();

            for (var i = start; i <= stop; i++) {
                letters.push({ row: i - start, letter: String.fromCharCode(i) });
            }return letters;
        }
    }, {
        key: "makeLine",
        value: function makeLine(letterCount, _ref) {
            var row = _ref.row;
            var letter = _ref.letter;

            var outerSpaces = "".padRight(letterCount - row - 1);
            var innerSpaces = "".padRight(row === 0 ? 0 : row * 2 - 1);

            return letter === 'A' ? "" + outerSpaces + letter + outerSpaces : "" + outerSpaces + letter + innerSpaces + letter + outerSpaces;
        }
    }]);

    return Diamond;
})();

exports["default"] = Diamond;
module.exports = exports["default"];