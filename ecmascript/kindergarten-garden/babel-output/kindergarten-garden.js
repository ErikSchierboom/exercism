'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Garden = (function () {
    function Garden(windowSills) {
        var children = arguments.length <= 1 || arguments[1] === undefined ? ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Fred', 'Ginny', 'Harriet', 'Ileana', 'Joseph', 'Kincaid', 'Larry'] : arguments[1];

        _classCallCheck(this, Garden);

        this.windowSills = windowSills.split("\n");
        this.children = children.sort();

        for (var index in this.children) {
            this.setPlantsForChild(index);
        }
    }

    _createClass(Garden, [{
        key: 'setPlantsForChild',
        value: function setPlantsForChild(index) {
            var child = this.children[index].toLowerCase();
            this[child] = [this.plantCodeToPlant(this.windowSills[0][index * 2]), this.plantCodeToPlant(this.windowSills[0][index * 2 + 1]), this.plantCodeToPlant(this.windowSills[1][index * 2]), this.plantCodeToPlant(this.windowSills[1][index * 2 + 1])];
        }
    }, {
        key: 'plantCodeToPlant',
        value: function plantCodeToPlant(code) {
            switch (code) {
                case 'V':
                    return 'violets';
                case 'R':
                    return 'radishes';
                case 'G':
                    return 'grass';
                case 'C':
                    return 'clover';
            }
        }
    }]);

    return Garden;
})();

exports['default'] = Garden;
module.exports = exports['default'];