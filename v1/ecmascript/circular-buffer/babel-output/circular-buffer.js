'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _slicedToArray = (function () { function sliceIterator(arr, i) { var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i['return']) _i['return'](); } finally { if (_d) throw _e; } } return _arr; } return function (arr, i) { if (Array.isArray(arr)) { return arr; } else if (Symbol.iterator in Object(arr)) { return sliceIterator(arr, i); } else { throw new TypeError('Invalid attempt to destructure non-iterable instance'); } }; })();

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

exports['default'] = circularBuffer;

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var CircularBuffer = (function () {
    function CircularBuffer(size) {
        _classCallCheck(this, CircularBuffer);

        this.size = size;
        this.items = [];
    }

    _createClass(CircularBuffer, [{
        key: 'read',
        value: function read() {
            if (this.items.length === 0) throw bufferEmptyException();

            var _items$splice = this.items.splice(0, 1);

            var _items$splice2 = _slicedToArray(_items$splice, 1);

            var value = _items$splice2[0];

            return value;
        }
    }, {
        key: 'write',
        value: function write(value) {
            if (this.items.length >= this.size) throw bufferFullException();

            if (value === null || value === undefined) return;

            this.items.push(value);
        }
    }, {
        key: 'forceWrite',
        value: function forceWrite(value) {
            if (this.items.length >= this.size) this.read();

            this.write(value);
        }
    }, {
        key: 'clear',
        value: function clear() {
            this.items = [];
        }
    }]);

    return CircularBuffer;
})();

var bufferEmptyException = function bufferEmptyException() {
    return {
        name: 'bufferEmptyException',
        message: 'Buffer is empty'
    };
};

exports.bufferEmptyException = bufferEmptyException;
var bufferFullException = function bufferFullException() {
    return {
        name: 'bufferFullException',
        message: "Buffer is full"
    };
};

exports.bufferFullException = bufferFullException;

function circularBuffer(size) {
    return new CircularBuffer(size);
}