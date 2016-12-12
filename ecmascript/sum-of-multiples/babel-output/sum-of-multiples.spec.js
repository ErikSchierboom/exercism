'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _sumOfMultiples = require('./sum-of-multiples');

var _sumOfMultiples2 = _interopRequireDefault(_sumOfMultiples);

describe('SumOfMultiples', function () {
  it('to 1', function () {
    expect((0, _sumOfMultiples2['default'])([3, 5]).to(1)).toBe(0);
  });

  it('to 3', function () {
    expect((0, _sumOfMultiples2['default'])([3, 5]).to(4)).toBe(3);
  });

  it('to 10', function () {
    expect((0, _sumOfMultiples2['default'])([3, 5]).to(10)).toBe(23);
  });

  it('to 100', function () {
    expect((0, _sumOfMultiples2['default'])([3, 5]).to(100)).toBe(2318);
  });

  it('to 1000', function () {
    expect((0, _sumOfMultiples2['default'])([3, 5]).to(1000)).toBe(233168);
  });

  it('[7, 13, 17] to 20', function () {
    expect((0, _sumOfMultiples2['default'])([7, 13, 17]).to(20)).toBe(51);
  });

  it('[4, 6] to 15', function () {
    expect((0, _sumOfMultiples2['default'])([4, 6]).to(15)).toBe(30);
  });

  it('[5, 6, 8] to 150', function () {
    expect((0, _sumOfMultiples2['default'])([5, 6, 8]).to(150)).toBe(4419);
  });

  it('[43, 47] to 10000', function () {
    expect((0, _sumOfMultiples2['default'])([43, 47]).to(10000)).toBe(2203160);
  });
});