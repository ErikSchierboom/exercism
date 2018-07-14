'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _binary = require('./binary');

var _binary2 = _interopRequireDefault(_binary);

describe('binary', function () {
  it('0 is decimal 0', function () {
    return expect(new _binary2['default']('0').toDecimal()).toEqual(0);
  });

  it('1 is decimal 1', function () {
    return expect(new _binary2['default']('1').toDecimal()).toEqual(1);
  });

  it('10 is decimal 2', function () {
    return expect(new _binary2['default']('10').toDecimal()).toEqual(2);
  });

  it('11 is decimal 3', function () {
    return expect(new _binary2['default']('11').toDecimal()).toEqual(3);
  });

  it('100 is decimal 4', function () {
    return expect(new _binary2['default']('100').toDecimal()).toEqual(4);
  });

  it('1001 is decimal 9', function () {
    return expect(new _binary2['default']('1001').toDecimal()).toEqual(9);
  });

  it('11010 is decimal 26', function () {
    return expect(new _binary2['default']('11010').toDecimal()).toEqual(26);
  });

  it('10001101000 is decimal 1128', function () {
    return expect(new _binary2['default']('10001101000').toDecimal()).toEqual(1128);
  });

  it('00011111 is decimal 31', function () {
    return expect(new _binary2['default']('00011111').toDecimal()).toEqual(31);
  });

  it('invalid inputs are decimal 0', function () {
    expect(new _binary2['default']('carrot').toDecimal()).toEqual(0);
    expect(new _binary2['default']('012').toDecimal()).toEqual(0);
    expect(new _binary2['default']('10nope').toDecimal()).toEqual(0);
    expect(new _binary2['default']('nope10').toDecimal()).toEqual(0);
    expect(new _binary2['default']('10nope10').toDecimal()).toEqual(0);
  });
});