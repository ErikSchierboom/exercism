'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _trinary = require('./trinary');

var _trinary2 = _interopRequireDefault(_trinary);

describe('Trinary', function () {

  it('1 is decimal 1', function () {
    expect(1).toEqual(new _trinary2['default']('1').toDecimal());
  });

  it('2 is decimal 2', function () {
    expect(2).toEqual(new _trinary2['default']('2').toDecimal());
  });

  it('10 is decimal 3', function () {
    expect(3).toEqual(new _trinary2['default']('10').toDecimal());
  });

  it('11 is decimal 4', function () {
    expect(4).toEqual(new _trinary2['default']('11').toDecimal());
  });

  it('100 is decimal 9', function () {
    expect(9).toEqual(new _trinary2['default']('100').toDecimal());
  });

  it('112 is decimal 14', function () {
    expect(14).toEqual(new _trinary2['default']('112').toDecimal());
  });

  it('222 is 26', function () {
    expect(26).toEqual(new _trinary2['default']('222').toDecimal());
  });

  it('1122000120 is 32091', function () {
    expect(32091).toEqual(new _trinary2['default']('1122000120').toDecimal());
  });

  it('invalid trinary is decimal 0', function () {
    expect(0).toEqual(new _trinary2['default']('carrot').toDecimal());
  });

  it('digits from 3 to 9 are invalid', function () {
    expect(0).toEqual(new _trinary2['default']('123').toDecimal());
  });
});