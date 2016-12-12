'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _romanNumerals = require('./roman-numerals');

var _romanNumerals2 = _interopRequireDefault(_romanNumerals);

describe('toRoman()', function () {
  it('converts 1', function () {
    return expect((0, _romanNumerals2['default'])(1)).toEqual('I');
  });
  it('converts 2', function () {
    return expect((0, _romanNumerals2['default'])(2)).toEqual('II');
  });
  it('converts 3', function () {
    return expect((0, _romanNumerals2['default'])(3)).toEqual('III');
  });
  it('converts 4', function () {
    return expect((0, _romanNumerals2['default'])(4)).toEqual('IV');
  });
  it('converts 5', function () {
    return expect((0, _romanNumerals2['default'])(5)).toEqual('V');
  });
  it('converts 6', function () {
    return expect((0, _romanNumerals2['default'])(6)).toEqual('VI');
  });
  it('converts 9', function () {
    return expect((0, _romanNumerals2['default'])(9)).toEqual('IX');
  });
  it('converts 27', function () {
    return expect((0, _romanNumerals2['default'])(27)).toEqual('XXVII');
  });
  it('converts 48', function () {
    return expect((0, _romanNumerals2['default'])(48)).toEqual('XLVIII');
  });
  it('converts 59', function () {
    return expect((0, _romanNumerals2['default'])(59)).toEqual('LIX');
  });
  it('converts 93', function () {
    return expect((0, _romanNumerals2['default'])(93)).toEqual('XCIII');
  });
  it('converts 141', function () {
    return expect((0, _romanNumerals2['default'])(141)).toEqual('CXLI');
  });
  it('converts 163', function () {
    return expect((0, _romanNumerals2['default'])(163)).toEqual('CLXIII');
  });
  it('converts 402', function () {
    return expect((0, _romanNumerals2['default'])(402)).toEqual('CDII');
  });
  it('converts 575', function () {
    return expect((0, _romanNumerals2['default'])(575)).toEqual('DLXXV');
  });
  it('converts 911', function () {
    return expect((0, _romanNumerals2['default'])(911)).toEqual('CMXI');
  });
  it('converts 1024', function () {
    return expect((0, _romanNumerals2['default'])(1024)).toEqual('MXXIV');
  });
  it('converts 3000', function () {
    return expect((0, _romanNumerals2['default'])(3000)).toEqual('MMM');
  });
});