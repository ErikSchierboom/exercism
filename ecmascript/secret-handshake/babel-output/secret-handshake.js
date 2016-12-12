"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _slicedToArray = (function () { function sliceIterator(arr, i) { var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i["return"]) _i["return"](); } finally { if (_d) throw _e; } } return _arr; } return function (arr, i) { if (Array.isArray(arr)) { return arr; } else if (Symbol.iterator in Object(arr)) { return sliceIterator(arr, i); } else { throw new TypeError("Invalid attempt to destructure non-iterable instance"); } }; })();

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var SecretHandshake = (function () {
    function SecretHandshake(number) {
        _classCallCheck(this, SecretHandshake);

        if (!/^\d+$/.test(number)) throw new Error('Handshake must be a number');

        this.number = number;
    }

    _createClass(SecretHandshake, [{
        key: "commands",
        value: function commands() {
            var commandMapping = [[1 << 0, "wink"], [1 << 1, "double blink"], [1 << 2, "close your eyes"], [1 << 3, "jump"]];

            var acc = [];

            var _iteratorNormalCompletion = true;
            var _didIteratorError = false;
            var _iteratorError = undefined;

            try {
                for (var _iterator = commandMapping[Symbol.iterator](), _step; !(_iteratorNormalCompletion = (_step = _iterator.next()).done); _iteratorNormalCompletion = true) {
                    var _step$value = _slicedToArray(_step.value, 2);

                    var mask = _step$value[0];
                    var str = _step$value[1];

                    if ((this.number & mask) !== 0) acc.push(str);
                }
            } catch (err) {
                _didIteratorError = true;
                _iteratorError = err;
            } finally {
                try {
                    if (!_iteratorNormalCompletion && _iterator["return"]) {
                        _iterator["return"]();
                    }
                } finally {
                    if (_didIteratorError) {
                        throw _iteratorError;
                    }
                }
            }

            if ((this.number & 1 << 4) !== 0) acc.reverse();

            return acc;
        }
    }]);

    return SecretHandshake;
})();

exports["default"] = SecretHandshake;
module.exports = exports["default"];