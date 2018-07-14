'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _secretHandshake = require('./secret-handshake');

var _secretHandshake2 = _interopRequireDefault(_secretHandshake);

describe('Secret Handshake', function () {

  it('binary 1 (hexadecimal 0x01) is a wink', function () {
    var handshake = new _secretHandshake2['default'](0x01);
    expect(handshake.commands()).toEqual(['wink']);
  });

  it('binary 10 (hexadecimal 0x02) is a double blink', function () {
    var handshake = new _secretHandshake2['default'](0x02);
    expect(handshake.commands()).toEqual(['double blink']);
  });

  it('binary 100 (hexadecimal 0x04) is close your eyes', function () {
    var handshake = new _secretHandshake2['default'](0x04);
    expect(handshake.commands()).toEqual(['close your eyes']);
  });

  it('binary 1000 (hexadecimal 0x08) is jump', function () {
    var handshake = new _secretHandshake2['default'](0x08);
    expect(handshake.commands()).toEqual(['jump']);
  });

  it('binary 11 (hexadecimal 0x03) is wink and double blink', function () {
    var handshake = new _secretHandshake2['default'](0x03);
    expect(handshake.commands()).toEqual(['wink', 'double blink']);
  });

  it('binary 10011 (hexadecimal 0x13) is double blink and wink', function () {
    var handshake = new _secretHandshake2['default'](0x13);
    expect(handshake.commands()).toEqual(['double blink', 'wink']);
  });

  it('binary 11111 (hexadecimal 0x1F) is jump, close your eyes, double blink, and wink', function () {
    var handshake = new _secretHandshake2['default'](0x1F);
    expect(handshake.commands()).toEqual(['jump', 'close your eyes', 'double blink', 'wink']);
  });

  it('text is an invalid secret handshake', function () {
    expect(function () {
      return new _secretHandshake2['default']('piggies');
    }).toThrow(new Error('Handshake must be a number'));
  });
});