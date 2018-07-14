'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _raindrops = require('./raindrops');

var _raindrops2 = _interopRequireDefault(_raindrops);

describe('Raindrops', function () {
  var drops = new _raindrops2['default']();

  it('converts 1', function () {
    return expect(drops.convert(1)).toEqual('1');
  });

  it('converts 3', function () {
    return expect(drops.convert(3)).toEqual('Pling');
  });

  it('converts 5', function () {
    return expect(drops.convert(5)).toEqual('Plang');
  });

  it('converts 7', function () {
    return expect(drops.convert(7)).toEqual('Plong');
  });

  it('converts 6', function () {
    return expect(drops.convert(6)).toEqual('Pling');
  });

  it('converts 9', function () {
    return expect(drops.convert(9)).toEqual('Pling');
  });

  it('converts 10', function () {
    return expect(drops.convert(10)).toEqual('Plang');
  });

  it('converts 14', function () {
    return expect(drops.convert(14)).toEqual('Plong');
  });

  it('converts 15', function () {
    return expect(drops.convert(15)).toEqual('PlingPlang');
  });

  it('converts 21', function () {
    return expect(drops.convert(21)).toEqual('PlingPlong');
  });

  it('converts 25', function () {
    return expect(drops.convert(25)).toEqual('Plang');
  });

  it('converts 35', function () {
    return expect(drops.convert(35)).toEqual('PlangPlong');
  });

  it('converts 49', function () {
    return expect(drops.convert(49)).toEqual('Plong');
  });

  it('converts 52', function () {
    return expect(drops.convert(52)).toEqual('52');
  });

  it('converts 105', function () {
    return expect(drops.convert(105)).toEqual('PlingPlangPlong');
  });

  it('converts 12121', function () {
    return expect(drops.convert(12121)).toEqual('12121');
  });
});