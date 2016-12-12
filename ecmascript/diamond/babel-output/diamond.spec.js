'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _diamondJs = require('./diamond.js');

var _diamondJs2 = _interopRequireDefault(_diamondJs);

describe('Make diamond function', function () {

  var diamond = new _diamondJs2['default']();

  it('test letter A', function () {
    var result = "A\n";
    expect(diamond.makeDiamond('A')).toEqual(result);
  });

  it('test letter C', function () {
    var result = ["  A  ", " B B ", "C   C", " B B ", "  A  "].join("\n") + "\n";
    expect(diamond.makeDiamond('C')).toEqual(result);
  });

  it('test letter E', function () {
    var result = ["    A    ", "   B B   ", "  C   C  ", " D     D ", "E       E", " D     D ", "  C   C  ", "   B B   ", "    A    "].join("\n") + "\n";
    expect(diamond.makeDiamond('E')).toEqual(result);
  });
});