'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _phoneNumber = require('./phone-number');

var _phoneNumber2 = _interopRequireDefault(_phoneNumber);

describe('PhoneNumber()', function () {

  it('cleans the number (123) 456-7890', function () {
    var phone = new _phoneNumber2['default']('(123) 456-7890');
    expect(phone.number()).toEqual('1234567890');
  });

  it('cleans numbers with dots', function () {
    var phone = new _phoneNumber2['default']('123.456.7890');
    expect(phone.number()).toEqual('1234567890');
  });

  it('valid when 11 digits and first digit is 1', function () {
    var phone = new _phoneNumber2['default']('11234567890');
    expect(phone.number()).toEqual('1234567890');
  });

  it('invalid when 11 digits', function () {
    var phone = new _phoneNumber2['default']('21234567890');
    expect(phone.number()).toEqual('0000000000');
  });

  it('invalid when 9 digits', function () {
    var phone = new _phoneNumber2['default']('123456789');
    expect(phone.number()).toEqual('0000000000');
  });

  it('has an area code', function () {
    var phone = new _phoneNumber2['default']('1234567890');
    expect(phone.areaCode()).toEqual('123');
  });

  it('formats a number', function () {
    var phone = new _phoneNumber2['default']('1234567890');
    expect(phone.toString()).toEqual('(123) 456-7890');
  });
});