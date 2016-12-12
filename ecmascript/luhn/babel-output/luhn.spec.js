'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _luhn = require('./luhn');

var _luhn2 = _interopRequireDefault(_luhn);

describe('Luhn', function () {

  it('check digit', function () {
    var luhn = new _luhn2['default'](34567);
    expect(luhn.checkDigit).toEqual(7);
  });

  it('check digit again', function () {
    var luhn = new _luhn2['default'](91370);
    expect(luhn.checkDigit).toEqual(0);
  });

  it('addends', function () {
    var luhn = new _luhn2['default'](12121);
    expect(luhn.addends).toEqual([1, 4, 1, 4, 1]);
  });

  it('too large added', function () {
    var luhn = new _luhn2['default'](8631);
    expect(luhn.addends).toEqual([7, 6, 6, 1]);
  });

  it('checksum', function () {
    var luhn = new _luhn2['default'](4913);
    expect(luhn.checksum).toEqual(22);
  });

  it('checksum again', function () {
    var luhn = new _luhn2['default'](201773);
    expect(luhn.checksum).toEqual(21);
  });

  it('invalid number', function () {
    var luhn = new _luhn2['default'](738);
    expect(luhn.valid).toEqual(false);
  });

  it('invalid number', function () {
    var luhn = new _luhn2['default'](8739567);
    expect(luhn.valid).toEqual(true);
  });

  it('create valid number', function () {
    var number = _luhn2['default'].create(123);
    expect(number).toEqual(1230);
  });

  it('create other valid number', function () {
    var number = _luhn2['default'].create(873956);
    expect(number).toEqual(8739567);
  });

  it('create yet another valid number', function () {
    var number = _luhn2['default'].create(837263756);
    expect(number).toEqual(8372637564);
  });
});