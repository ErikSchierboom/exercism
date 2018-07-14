'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _hexadecimal = require('./hexadecimal');

var _hexadecimal2 = _interopRequireDefault(_hexadecimal);

describe('Hexadecimal', function () {

   it('hex 1 is decimal 1', function () {
      var hex = new _hexadecimal2['default']('1');
      expect(hex.toDecimal()).toEqual(1);
   });

   it('hex c is decimal 12', function () {
      var hex = new _hexadecimal2['default']('c');
      expect(hex.toDecimal()).toEqual(12);
   });

   it('hex 10 is decimal 16', function () {
      var hex = new _hexadecimal2['default']('10');
      expect(hex.toDecimal()).toEqual(16);
   });

   it('hex af is decimal 175', function () {
      var hex = new _hexadecimal2['default']('af');
      expect(hex.toDecimal()).toEqual(175);
   });

   it('hex 100 is decimal 256', function () {
      var hex = new _hexadecimal2['default']('100');
      expect(hex.toDecimal()).toEqual(256);
   });

   it('hex 19ace is decimal 105166', function () {
      var hex = new _hexadecimal2['default']('19ace');
      expect(hex.toDecimal()).toEqual(105166);
   });

   it('invalid hex is decimal 0', function () {
      var hex = new _hexadecimal2['default']('carrot');
      expect(hex.toDecimal()).toEqual(0);
   });

   it('hexadecimal value for HTML/CSS black color', function () {
      var hex = new _hexadecimal2['default']('000000');
      expect(hex.toDecimal()).toEqual(0);
   });

   it('hexadecimal value for HTML/CSS white color', function () {
      var hex = new _hexadecimal2['default']('ffffff');
      expect(hex.toDecimal()).toEqual(16777215);
   });

   it('hexadecimal value for HTML/CSS yellow color', function () {
      var hex = new _hexadecimal2['default']('ffff00');
      expect(hex.toDecimal()).toEqual(16776960);
   });
});