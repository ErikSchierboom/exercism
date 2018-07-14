'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _spaceAge = require('./space-age');

var _spaceAge2 = _interopRequireDefault(_spaceAge);

describe('Space Age', function () {

  it('age in seconds', function () {
    var age = new _spaceAge2['default'](1000000);
    expect(age.seconds).toEqual(1000000);
  });

  it('age in earth years', function () {
    var age = new _spaceAge2['default'](1000000000);
    expect(age.onEarth()).toEqual(31.69);
  });

  it('age in mercury years', function () {
    var age = new _spaceAge2['default'](2134835688);
    expect(age.onEarth()).toEqual(67.65);
    expect(age.onMercury()).toEqual(280.88);
  });

  it('age in venus years', function () {
    var age = new _spaceAge2['default'](189839836);
    expect(age.onEarth()).toEqual(6.02);
    expect(age.onVenus()).toEqual(9.78);
  });

  it('age in mars years', function () {
    var age = new _spaceAge2['default'](2329871239);
    expect(age.onEarth()).toEqual(73.83);
    expect(age.onMars()).toEqual(39.25);
  });

  it('age in jupiter years', function () {
    var age = new _spaceAge2['default'](901876382);
    expect(age.onEarth()).toEqual(28.58);
    expect(age.onJupiter()).toEqual(2.41);
  });

  it('age in saturn years', function () {
    var age = new _spaceAge2['default'](3000000000);
    expect(age.onEarth()).toEqual(95.06);
    expect(age.onSaturn()).toEqual(3.23);
  });

  it('age in uranus years', function () {
    var age = new _spaceAge2['default'](3210123456);
    expect(age.onEarth()).toEqual(101.72);
    expect(age.onUranus()).toEqual(1.21);
  });

  it('age in neptune year', function () {
    var age = new _spaceAge2['default'](8210123456);
    expect(age.onEarth()).toEqual(260.16);
    expect(age.onNeptune()).toEqual(1.58);
  });
});