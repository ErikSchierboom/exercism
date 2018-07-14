'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

exports['default'] = bracket;

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var BracketPair = (function () {
    function BracketPair(open, close) {
        _classCallCheck(this, BracketPair);

        this._open = open;
        this._close = close;
    }

    _createClass(BracketPair, [{
        key: 'open',
        get: function get() {
            return this._open;
        }
    }, {
        key: 'close',
        get: function get() {
            return this._close;
        }
    }]);

    return BracketPair;
})();

var bracketPairs = [new BracketPair('[', ']'), new BracketPair('(', ')'), new BracketPair('{', '}')];

function bracket(input) {
    var brackets = [];

    for (var i = 0; i < input.length; i++) {
        var c = input[i];

        var _iteratorNormalCompletion = true;
        var _didIteratorError = false;
        var _iteratorError = undefined;

        try {
            for (var _iterator = bracketPairs[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
                var bracketPair = _step.value;

                if (c == bracketPair.open) brackets.push(c);else if (c == bracketPair.close) if (brackets.length === 0 || brackets.pop() !== bracketPair.open) return false;
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
    }

    return brackets.length === 0;
}

module.exports = exports['default'];