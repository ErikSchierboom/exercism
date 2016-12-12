'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _slicedToArray = (function () { function sliceIterator(arr, i) { var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i['return']) _i['return'](); } finally { if (_d) throw _e; } } return _arr; } return function (arr, i) { if (Array.isArray(arr)) { return arr; } else if (Symbol.iterator in Object(arr)) { return sliceIterator(arr, i); } else { throw new TypeError('Invalid attempt to destructure non-iterable instance'); } }; })();

exports['default'] = toRoman;
var romanNumeralValues = new Map();
romanNumeralValues.set(1000, 'M');
romanNumeralValues.set(900, 'CM');
romanNumeralValues.set(500, 'D');
romanNumeralValues.set(400, 'CD');
romanNumeralValues.set(100, 'C');
romanNumeralValues.set(90, 'XC');
romanNumeralValues.set(50, 'L');
romanNumeralValues.set(40, 'XL');
romanNumeralValues.set(10, 'X');
romanNumeralValues.set(9, 'IX');
romanNumeralValues.set(5, 'V');
romanNumeralValues.set(4, 'IV');
romanNumeralValues.set(1, 'I');

function toRoman(number) {
    var _iteratorNormalCompletion = true;
    var _didIteratorError = false;
    var _iteratorError = undefined;

    try {
        for (var _iterator = romanNumeralValues.entries()[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
            var _step$value = _slicedToArray(_step.value, 2);

            var threshold = _step$value[0];
            var numeral = _step$value[1];

            if (number >= threshold) {
                return numeral + toRoman(number - threshold);
            }
        }
    } catch (err) {
        _didIteratorError = true;
        _iteratorError = err;
    } finally {
        try {
            if (!_iteratorNormalCompletion && _iterator['return']) {
                _iterator['return']();
            }
        } finally {
            if (_didIteratorError) {
                throw _iteratorError;
            }
        }
    }

    return '';
}

module.exports = exports['default'];