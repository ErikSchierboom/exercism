'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var PhoneNumber = (function () {
    function PhoneNumber(input) {
        _classCallCheck(this, PhoneNumber);

        this.validatedNumber = input.replace(/(\D)/g, '');

        if (this.validatedNumber.length === 11 && this.validatedNumber[0] === '1') {
            this.validatedNumber = this.validatedNumber.substr(1);
        }

        if (this.validatedNumber.length !== 10) {
            this.validatedNumber = '0000000000';
        }
    }

    _createClass(PhoneNumber, [{
        key: 'number',
        value: function number() {
            return this.validatedNumber;
        }
    }, {
        key: 'areaCode',
        value: function areaCode() {
            return this.validatedNumber.substr(0, 3);
        }
    }, {
        key: 'toString',
        value: function toString() {
            return '(' + this.areaCode() + ') ' + this.validatedNumber.substr(3, 3) + '-' + this.validatedNumber.substr(6, 4);
        }
    }]);

    return PhoneNumber;
})();

exports['default'] = PhoneNumber;
module.exports = exports['default'];