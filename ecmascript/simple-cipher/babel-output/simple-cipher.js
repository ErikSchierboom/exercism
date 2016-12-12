'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min;
}

Array.prototype.random = function () {
    return this[getRandomInt(0, this.length)];
};

var alphabet = "abcdefghijklmnopqrstuvwxyz";
var letters = [].concat(_toConsumableArray(alphabet));

function randomLetter() {
    return letters.random();
}

function randomString(length) {
    var str = '';

    for (var i = 0; i < length; i++) {
        str += randomLetter();
    }return str;
}

function mod(x, y) {
    return Math.floor((x % y + y) % y);
}

var Cipher = (function () {
    function Cipher(key) {
        _classCallCheck(this, Cipher);

        if (key === '') throw new Error('Bad key');

        this._key = key || this.generateKey();

        if (!/^[a-z]+$/.test(this._key)) throw new Error('Bad key');
    }

    _createClass(Cipher, [{
        key: 'generateKey',
        value: function generateKey() {
            var keyLength = 100;
            return randomString(keyLength);
        }
    }, {
        key: 'encode',
        value: function encode(plainText) {
            return this.shift(plainText, function (c, s) {
                return c + s;
            });
        }
    }, {
        key: 'decode',
        value: function decode(encryptedText) {
            return this.shift(encryptedText, function (c, s) {
                return c - s;
            });
        }
    }, {
        key: 'shift',
        value: function shift(text, applyShift) {
            var shifted = '';

            for (var i = 0; i < text.length; i++) {
                shifted += String.fromCharCode(this.shiftCharacter(text[i], i, applyShift));
            }return shifted;
        }
    }, {
        key: 'shiftCharacter',
        value: function shiftCharacter(c, i, applyShift) {
            return 'a'.charCodeAt() + this.getCharacterShiftValue(c, i, applyShift);
        }
    }, {
        key: 'getCharacterShiftValue',
        value: function getCharacterShiftValue(c, i, applyShift) {
            return mod(applyShift(this.normalizeCharacter(c), this.getShiftValue(i)), letters.length);
        }
    }, {
        key: 'normalizeCharacter',
        value: function normalizeCharacter(c) {
            return c.charCodeAt() - 'a'.charCodeAt();
        }
    }, {
        key: 'getShiftValue',
        value: function getShiftValue(i) {
            return this.key.charCodeAt(i) % 'a'.charCodeAt();
        }
    }, {
        key: 'key',
        get: function get() {
            return this._key;
        }
    }]);

    return Cipher;
})();

exports['default'] = Cipher;
module.exports = exports['default'];