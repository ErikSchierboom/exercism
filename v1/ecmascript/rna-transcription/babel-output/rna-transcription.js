'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Transcriptor = (function () {
    function Transcriptor() {
        _classCallCheck(this, Transcriptor);
    }

    _createClass(Transcriptor, [{
        key: 'toRna',
        value: function toRna(dna) {
            return Array.prototype.map.call(dna, this.dnaToRna).join('');
        }
    }, {
        key: 'dnaToRna',
        value: function dnaToRna(nucleotide) {
            switch (nucleotide) {
                case 'G':
                    return 'C';
                case 'C':
                    return 'G';
                case 'T':
                    return 'A';
                case 'A':
                    return 'U';
            }
        }
    }]);

    return Transcriptor;
})();

exports['default'] = Transcriptor;
module.exports = exports['default'];