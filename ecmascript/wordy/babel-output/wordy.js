'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _slicedToArray = (function () { function sliceIterator(arr, i) { var _arr = []; var _n = true; var _d = false; var _e = undefined; try { for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) { _arr.push(_s.value); if (i && _arr.length === i) break; } } catch (err) { _d = true; _e = err; } finally { try { if (!_n && _i['return']) _i['return'](); } finally { if (_d) throw _e; } } return _arr; } return function (arr, i) { if (Array.isArray(arr)) { return arr; } else if (Symbol.iterator in Object(arr)) { return sliceIterator(arr, i); } else { throw new TypeError('Invalid attempt to destructure non-iterable instance'); } }; })();

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

var _get = function get(_x, _x2, _x3) { var _again = true; _function: while (_again) { var object = _x, property = _x2, receiver = _x3; _again = false; if (object === null) object = Function.prototype; var desc = Object.getOwnPropertyDescriptor(object, property); if (desc === undefined) { var parent = Object.getPrototypeOf(object); if (parent === null) { return undefined; } else { _x = parent; _x2 = property; _x3 = receiver; _again = true; desc = parent = undefined; continue _function; } } else if ('value' in desc) { return desc.value; } else { var getter = desc.get; if (getter === undefined) { return undefined; } return getter.call(receiver); } } };

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

function _inherits(subClass, superClass) { if (typeof superClass !== 'function' && superClass !== null) { throw new TypeError('Super expression must either be null or a function, not ' + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var ArgumentError = (function (_Error) {
    _inherits(ArgumentError, _Error);

    function ArgumentError() {
        _classCallCheck(this, ArgumentError);

        _get(Object.getPrototypeOf(ArgumentError.prototype), 'constructor', this).apply(this, arguments);
    }

    return ArgumentError;
})(Error);

exports.ArgumentError = ArgumentError;

var WordProblem = (function () {
    function WordProblem(problem) {
        _classCallCheck(this, WordProblem);

        this.problem = problem.replace('What is ', '').replace('?', '');
    }

    _createClass(WordProblem, [{
        key: 'parseTokens',
        value: function parseTokens() {
            return this.problem.match(/(-?\d+|plus|minus|multiplied by|divided by)/g);
        }
    }, {
        key: 'parseEquation',
        value: function parseEquation() {
            var tokens = this.parseTokens();

            if (!tokens || tokens.length < 3 || tokens.length % 2 == 0) throw new ArgumentError();

            return tokens;
        }
    }, {
        key: 'isOperand',
        value: function isOperand(token) {
            return (/(-?\d+)$/g.test(token)
            );
        }
    }, {
        key: 'isOperator',
        value: function isOperator(token) {
            return (/^(plus|minus|multiplied by|divided by)$/g.test(token)
            );
        }
    }, {
        key: 'solveEquation',
        value: function solveEquation(equation) {
            var left = equation[0];

            if (!this.isOperand(left)) throw new ArgumentError();

            var answer = parseInt(left);

            for (var i = 1; i < equation.length; i += 2) {
                var _equation$slice = equation.slice(i, i + 2);

                var _equation$slice2 = _slicedToArray(_equation$slice, 2);

                var operator = _equation$slice2[0];
                var right = _equation$slice2[1];

                if (!this.isOperator(operator) || !this.isOperand(right)) throw new ArgumentError();

                switch (operator) {
                    case 'plus':
                        answer += parseInt(right);
                        break;
                    case 'minus':
                        answer -= parseInt(right);
                        break;
                    case 'multiplied by':
                        answer *= parseInt(right);
                        break;
                    case 'divided by':
                        answer /= parseInt(right);
                        break;
                }
            }

            return answer;
        }
    }, {
        key: 'answer',
        value: function answer() {
            var equation = this.parseEquation();
            return this.solveEquation(equation);
        }
    }]);

    return WordProblem;
})();

exports.WordProblem = WordProblem;