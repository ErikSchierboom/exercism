'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Crypto = (function () {
    function Crypto(input) {
        _classCallCheck(this, Crypto);

        this.input = input;
    }

    _createClass(Crypto, [{
        key: 'size',
        value: function size() {
            return Math.ceil(Math.sqrt(this.normalizePlaintext().length));
        }
    }, {
        key: 'normalizePlaintext',
        value: function normalizePlaintext() {
            return this.input.toLowerCase().replace(/[^\w]/g, '');
        }
    }, {
        key: 'normalizeCiphertext',
        value: function normalizeCiphertext() {
            return this.transpose(this.plaintextSegments()).join(' ');
        }
    }, {
        key: 'ciphertext',
        value: function ciphertext() {
            return this.transpose(this.plaintextSegments()).join("");
        }
    }, {
        key: 'plaintextSegments',
        value: function plaintextSegments() {
            var segments = [];
            var plainText = this.normalizePlaintext();
            var segmentSize = this.size();
            var numberOfSegments = Math.ceil(plainText.length / segmentSize);

            for (var i = 0; i < numberOfSegments; i++) {
                segments.push(plainText.substr(i * segmentSize, Math.min(plainText.length - i * segmentSize, segmentSize)));
            }return segments;
        }
    }, {
        key: 'transpose',
        value: function transpose(input) {
            var transposed = [];

            for (var i = 0; i < input.length; i++) {
                for (var j = 0; j < input[i].length; j++) {
                    if (transposed.length <= j) transposed[j] = '';

                    transposed[j] += input[i][j];
                }
            }

            return transposed;
        }
    }]);

    return Crypto;
})();

exports['default'] = Crypto;
module.exports = exports['default'];