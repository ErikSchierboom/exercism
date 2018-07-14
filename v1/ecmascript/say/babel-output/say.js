'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _slicedToArray = (function () { function sliceIterator(arr, i) { var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i['return']) _i['return'](); } finally { if (_d) throw _e; } } return _arr; } return function (arr, i) { if (Array.isArray(arr)) { return arr; } else if (Symbol.iterator in Object(arr)) { return sliceIterator(arr, i); } else { throw new TypeError('Invalid attempt to destructure non-iterable instance'); } }; })();

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Say = (function () {
    function Say() {
        _classCallCheck(this, Say);
    }

    _createClass(Say, [{
        key: 'inEnglish',
        value: function inEnglish(number) {
            if (number < 0 || number > 999999999999) throw new Error('Number must be between 0 and 999,999,999,999.');

            if (number === 0) return 'zero';

            return this.parts(number).join(' ');
        }
    }, {
        key: 'parts',
        value: function parts(number) {
            var _counts = this.counts(number);

            var _counts2 = _slicedToArray(_counts, 4);

            var billionsCount = _counts2[0];
            var millionsCount = _counts2[1];
            var thousandsCount = _counts2[2];
            var remainder = _counts2[3];

            return [this.billions(billionsCount), this.millions(millionsCount), this.thousands(thousandsCount), this.hundreds(remainder)].filter(function (x) {
                return x !== null;
            });
        }
    }, {
        key: 'bases',
        value: function bases(number) {
            var values = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"];

            return number > 0 && number <= values.length ? values[number - 1] : null;
        }
    }, {
        key: 'tens',
        value: function tens(number) {
            if (number < 20) return this.bases(number);

            var values = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"];

            var count = Math.floor(number / 10);
            var remainder = number % 10;
            var bases = this.bases(remainder);

            var countStr = values[count - 2];
            var basesStr = bases == null ? "" : '-' + bases;

            return '' + countStr + basesStr;
        }
    }, {
        key: 'hundreds',
        value: function hundreds(number) {
            if (number < 100) return this.tens(number);

            var count = Math.floor(number / 100);
            var remainder = number % 100;
            var bases = this.bases(count);
            var tens = this.tens(remainder);
            var tensStr = tens == null ? "" : ' ' + tens;

            return bases + ' hundred' + tensStr;
        }
    }, {
        key: 'chunk',
        value: function chunk(str, number) {
            var hundreds = this.hundreds(number);
            return hundreds == null ? null : hundreds + ' ' + str;
        }
    }, {
        key: 'thousands',
        value: function thousands(number) {
            return this.chunk("thousand", number);
        }
    }, {
        key: 'millions',
        value: function millions(number) {
            return this.chunk("million", number);
        }
    }, {
        key: 'billions',
        value: function billions(number) {
            return this.chunk("billion", number);
        }
    }, {
        key: 'counts',
        value: function counts(number) {
            var billionsCount = Math.floor(number / 1000000000);
            var billionsRemainder = number % 1000000000;

            var millionsCount = Math.floor(billionsRemainder / 1000000);
            var millionsRemainder = billionsRemainder % 1000000;

            var thousandsCount = Math.floor(millionsRemainder / 1000);
            var thousandsRemainder = millionsRemainder % 1000;

            return [billionsCount, millionsCount, thousandsCount, thousandsRemainder];
        }
    }]);

    return Say;
})();

exports['default'] = Say;
module.exports = exports['default'];