'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Acronyms = (function () {
    function Acronyms() {
        _classCallCheck(this, Acronyms);
    }

    _createClass(Acronyms, null, [{
        key: 'parse',
        value: function parse(input) {
            return input.match(/[A-Z]+[a-z]*|[a-z]+/g).map(function (str) {
                return str.toUpperCase()[0];
            }).join('');
        }
    }]);

    return Acronyms;
})();

exports['default'] = Acronyms;
module.exports = exports['default'];