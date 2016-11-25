"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

var marked0$0 = [range].map(regeneratorRuntime.mark);

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function range(begin, end) {
    var i;
    return regeneratorRuntime.wrap(function range$(context$1$0) {
        while (1) switch (context$1$0.prev = context$1$0.next) {
            case 0:
                i = begin;

            case 1:
                if (!(i <= end)) {
                    context$1$0.next = 7;
                    break;
                }

                context$1$0.next = 4;
                return i;

            case 4:
                i++;
                context$1$0.next = 1;
                break;

            case 7:
            case "end":
                return context$1$0.stop();
        }
    }, marked0$0[0], this);
}

var BeerSong = (function () {
    function BeerSong() {
        _classCallCheck(this, BeerSong);
    }

    _createClass(BeerSong, null, [{
        key: "verse",
        value: function verse(number) {
            switch (number) {
                case 0:
                    return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n";
                case 1:
                    return "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n";
                case 2:
                    return "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n";
                default:
                    return number + " bottles of beer on the wall, " + number + " bottles of beer.\nTake one down and pass it around, " + (number - 1) + " bottles of beer on the wall.\n";
            }
        }
    }, {
        key: "sing",
        value: function sing() {
            var start = arguments.length <= 0 || arguments[0] === undefined ? 99 : arguments[0];
            var stop = arguments.length <= 1 || arguments[1] === undefined ? 0 : arguments[1];

            var verses = [].concat(_toConsumableArray(range(stop, start))).reverse().map(BeerSong.verse);
            return verses.join("\n");
        }
    }]);

    return BeerSong;
})();

exports["default"] = BeerSong;
module.exports = exports["default"];