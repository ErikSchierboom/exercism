'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _nthPrime = require('./nth-prime');

var _nthPrime2 = _interopRequireDefault(_nthPrime);

describe('Prime', function () {
  var prime = new _nthPrime2['default']();

  it('first', function () {
    expect(prime.nth(1)).toEqual(2);
  });

  it('second', function () {
    expect(prime.nth(2)).toEqual(3);
  });

  it('sixth', function () {
    expect(prime.nth(6)).toEqual(13);
  });

  it('big prime', function () {
    expect(prime.nth(10001)).toEqual(104743);
  });

  it('weird case', function () {
    expect(function () {
      return prime.nth(0);
    }).toThrow(new Error('Prime is not possible'));
  });
});