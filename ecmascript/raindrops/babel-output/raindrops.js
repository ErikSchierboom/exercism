'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Raindrops = (function () {
    function Raindrops() {
        _classCallCheck(this, Raindrops);
    }

    _createClass(Raindrops, [{
        key: 'convert',
        value: function convert(i) {
            var parts = [];

            if (i % 3 == 0) parts.push('Pling');

            if (i % 5 == 0) parts.push('Plang');

            if (i % 7 == 0) parts.push('Plong');

            return parts.length === 0 ? i.toString() : parts.join('');
        }
    }]);

    return Raindrops;
})();

exports['default'] = Raindrops;
module.exports = exports['default'];