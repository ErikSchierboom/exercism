'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Queens = (function () {
    function Queens(positioning) {
        _classCallCheck(this, Queens);

        this._white = positioning ? positioning.white : [0, 3];
        this._black = positioning ? positioning.black : [7, 3];
    }

    _createClass(Queens, [{
        key: 'canAttack',
        value: function canAttack() {
            return this._white[0] === this._black[0] || this._white[1] === this._black[1] || Math.abs(this._black[0] - this._white[0]) === Math.abs(this._black[1] - this._white[1]);
        }
    }, {
        key: 'toString',
        value: function toString() {
            var board = '';

            for (var row = 0; row < 8; row++) {
                var cells = [];

                for (var col = 0; col < 8; col++) {
                    if (this.white[0] === row && this.white[1] === col) cells.push('W');else if (this.black[0] === row && this.black[1] === col) cells.push('B');else cells.push('_');
                }

                board += cells.join(' ') + '\n';
            }

            return board;
        }
    }, {
        key: 'white',
        get: function get() {
            return this._white;
        }
    }, {
        key: 'black',
        get: function get() {
            return this._black;
        }
    }]);

    return Queens;
})();

exports['default'] = Queens;
module.exports = exports['default'];