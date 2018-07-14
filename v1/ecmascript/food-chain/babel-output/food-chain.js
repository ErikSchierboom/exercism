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

var Song = (function () {
    function Song() {
        _classCallCheck(this, Song);

        this.numberOfVerses = 8;

        this.subjects = ["spider", "bird", "cat", "dog", "goat", "cow"];

        this.followUps = ["It wriggled and jiggled and tickled inside her.", "How absurd to swallow a bird!", "Imagine that, to swallow a cat!", "What a hog, to swallow a dog!", "Just opened her throat and swallowed a goat!", "I don't know how she swallowed a cow!"];

        this.history = ["I don't know how she swallowed a cow!", "She swallowed the cow to catch the goat.", "She swallowed the goat to catch the dog.", "She swallowed the dog to catch the cat.", "She swallowed the cat to catch the bird.", "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.", "She swallowed the spider to catch the fly.", "I don't know why she swallowed the fly. Perhaps she'll die."];
    }

    _createClass(Song, [{
        key: "verseBegin",
        value: function verseBegin(number) {
            if (number == 1) {
                return "I know an old lady who swallowed a fly.";
            }

            if (number == 8) {
                return "I know an old lady who swallowed a horse.";
            }

            var subject = this.subjects[number - 2];
            var followUp = this.followUps[number - 2];
            return "I know an old lady who swallowed a " + subject + ".\n" + followUp;
        }
    }, {
        key: "verseEnd",
        value: function verseEnd(number) {
            if (number == 8) {
                return "She's dead, of course!";
            }

            return this.history.slice(this.history.length - number, this.history.length - number + number).join("\n");
        }
    }, {
        key: "verse",
        value: function verse(number) {
            return this.verseBegin(number) + "\n" + this.verseEnd(number) + "\n";
        }
    }, {
        key: "verses",
        value: function verses(begin, end) {
            var _this = this;

            var verses = [].concat(_toConsumableArray(range(begin, end))).map(function (number) {
                return _this.verse(number) + "\n";
            });
            return verses.join("");
        }
    }]);

    return Song;
})();

exports["default"] = Song;
module.exports = exports["default"];