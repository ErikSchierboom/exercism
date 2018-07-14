'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _octal = require('./octal');

var _octal2 = _interopRequireDefault(_octal);

describe('octal', function () {

  it('1 is decimal 1', function () {
    expect(new _octal2['default']('1').toDecimal()).toEqual(1);
  });

  it('10 is decimal 8', function () {
    expect(new _octal2['default']('10').toDecimal()).toEqual(8);
  });

  it('17 is decimal 15', function () {
    expect(new _octal2['default']('17').toDecimal()).toEqual(15);
  });

  it('11 is decimal 9', function () {
    expect(new _octal2['default']('11').toDecimal()).toEqual(9);
  });

  it('130 is decimal 88', function () {
    expect(new _octal2['default']('130').toDecimal()).toEqual(88);
  });

  it('2047 is decimal 1063', function () {
    expect(new _octal2['default']('2047').toDecimal()).toEqual(1063);
  });

  it('7777 is decimal 4095', function () {
    expect(new _octal2['default']('7777').toDecimal()).toEqual(4095);
  });

  it('1234567 is decimal 342391', function () {
    expect(new _octal2['default']('1234567').toDecimal()).toEqual(342391);
  });

  it('invalid is decimal 0', function () {
    expect(new _octal2['default']('carrot').toDecimal()).toEqual(0);
  });

  it('considers the digit 8 as invalid', function () {
    expect(new _octal2['default']('12345678').toDecimal()).toEqual(0);
  });
});