'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

function _toConsumableArray(arr) { if (Array.isArray(arr)) { for (var i = 0, arr2 = Array(arr.length); i < arr.length; i++) arr2[i] = arr[i]; return arr2; } else { return Array.from(arr); } }

var blockSize = 5;
var minLetterValue = 'a'.charCodeAt();
var maxLetterValue = 'z'.charCodeAt();

function getEncodedCharacters(words) {
    return [].concat(_toConsumableArray(getValidCharacters(words))).map(encode);
}

function getValidCharacters(words) {
    return words.toLowerCase().replace(/[^\w]/g, "");
}

function encode(c) {
    if (/\d/.test(c)) return c;

    return String.fromCharCode(minLetterValue + (maxLetterValue - c.charCodeAt()));
}

function encodeInBlocks(value) {
    var blocks = [];

    for (var i = 0; i < value.length; i += blockSize) {
        blocks.push(value.slice(i, i + blockSize).join(""));
    }return blocks;
}

var atbash = {
    encode: function encode(input) {
        return encodeInBlocks(getEncodedCharacters(input)).join(' ');
    }
};

exports['default'] = atbash;
module.exports = exports['default'];