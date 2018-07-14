'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var allergenMasks = {
    'eggs': 1,
    'peanuts': 2,
    'shellfish': 4,
    'strawberries': 8,
    'tomatoes': 16,
    'chocolate': 32,
    'pollen': 64,
    'cats': 128
};

var Allergies = (function () {
    function Allergies(allergies) {
        _classCallCheck(this, Allergies);

        this.allergies = allergies;
    }

    _createClass(Allergies, [{
        key: 'list',
        value: function list() {
            var _this = this;

            return Object.keys(allergenMasks).filter(function (allergen) {
                return _this.allergicTo(allergen);
            });
        }
    }, {
        key: 'allergicTo',
        value: function allergicTo(allergen) {
            return (this.allergies & allergenMasks[allergen]) !== 0;
        }
    }]);

    return Allergies;
})();

exports['default'] = Allergies;
module.exports = exports['default'];