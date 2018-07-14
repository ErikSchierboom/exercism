'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _accumulate = require('./accumulate');

var _accumulate2 = _interopRequireDefault(_accumulate);

describe('accumulate()', function () {

  it('accumulation empty', function () {
    var accumulator = function accumulator(e) {
      return e * e;
    };
    expect((0, _accumulate2['default'])([], accumulator)).toEqual([]);
  });

  it('accumulate squares', function () {
    var accumulator = function accumulator(number) {
      return number * number;
    };
    var result = (0, _accumulate2['default'])([1, 2, 3], accumulator);
    expect(result).toEqual([1, 4, 9]);
  });

  it('accumulate upcases', function () {
    var accumulator = function accumulator(word) {
      return word.toUpperCase();
    };
    var result = (0, _accumulate2['default'])('hello world'.split(/\s/), accumulator);
    expect(result).toEqual(['HELLO', 'WORLD']);
  });

  it('accumulate reversed strings', function () {
    var accumulator = function accumulator(word) {
      return word.split('').reverse().join('');
    };
    var result = (0, _accumulate2['default'])('the quick brown fox etc'.split(/\s/), accumulator);
    expect(result).toEqual(['eht', 'kciuq', 'nworb', 'xof', 'cte']);
  });

  it('accumulate recursively', function () {
    var result = (0, _accumulate2['default'])('a b c'.split(/\s/), function (char) {
      return (0, _accumulate2['default'])('1 2 3'.split(/\s/), function (digit) {
        return char + digit;
      });
    });

    expect(result).toEqual([['a1', 'a2', 'a3'], ['b1', 'b2', 'b3'], ['c1', 'c2', 'c3']]);
  });
});