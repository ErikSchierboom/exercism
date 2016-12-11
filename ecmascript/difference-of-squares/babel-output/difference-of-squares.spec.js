'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _differenceOfSquares = require('./difference-of-squares');

var _differenceOfSquares2 = _interopRequireDefault(_differenceOfSquares);

describe('Squares', function () {

  describe('up to 5', function () {
    var squares = new _differenceOfSquares2['default'](5);

    it('gets the square of sums', function () {
      expect(squares.squareOfSums).toBe(225);
    });

    it('gets the sum of squares', function () {
      expect(squares.sumOfSquares).toBe(55);
    });

    it('gets the difference', function () {
      expect(squares.difference).toBe(170);
    });
  });

  describe('up to 10', function () {
    var squares = new _differenceOfSquares2['default'](10);

    it('gets the square of sums', function () {
      expect(squares.squareOfSums).toBe(3025);
    });

    it('gets the sum of squares', function () {
      expect(squares.sumOfSquares).toBe(385);
    });

    it('gets the difference', function () {
      expect(squares.difference).toBe(2640);
    });
  });

  describe('up to 100', function () {
    var squares = new _differenceOfSquares2['default'](100);

    it('gets the square of sums', function () {
      expect(squares.squareOfSums).toBe(25502500);
    });

    it('gets the sum of squares', function () {
      expect(squares.sumOfSquares).toBe(338350);
    });

    it('gets the difference', function () {
      expect(squares.difference).toBe(25164150);
    });
  });
});