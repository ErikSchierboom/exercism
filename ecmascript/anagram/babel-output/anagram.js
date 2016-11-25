'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Anagram = (function () {
    function Anagram(input) {
        _classCallCheck(this, Anagram);

        this.input = input.toLowerCase();
        this.sortedInput = this.sortedCharArrayForString(input);
    }

    _createClass(Anagram, [{
        key: 'matches',
        value: function matches() {
            var _this = this;

            for (var _len = arguments.length, candidates = Array(_len), _key = 0; _key < _len; _key++) {
                candidates[_key] = arguments[_key];
            }

            candidates = Array.isArray(candidates[0]) ? candidates[0] : candidates;

            return candidates.filter(function (word) {
                return _this.isAnagram(word);
            });
        }
    }, {
        key: 'isAnagram',
        value: function isAnagram(word) {
            return this.notSameAsInput(word) && this.hasSameLettersAsInput(word);
        }
    }, {
        key: 'notSameAsInput',
        value: function notSameAsInput(word) {
            return this.input !== word.toLowerCase();
        }
    }, {
        key: 'hasSameLettersAsInput',
        value: function hasSameLettersAsInput(word) {
            return this.sortedCharArrayForString(word) === this.sortedInput;
        }
    }, {
        key: 'sortedCharArrayForString',
        value: function sortedCharArrayForString(word) {
            return [].concat(_toConsumableArray(word.toLowerCase())).sort().join('');
        }
    }]);

    return Anagram;
})();

exports['default'] = Anagram;
module.exports = exports['default'];