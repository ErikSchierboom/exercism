'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _cryptoSquare = require('./crypto-square');

var _cryptoSquare2 = _interopRequireDefault(_cryptoSquare);

describe('Crypto', function () {
  it('normalize strange characters', function () {
    var crypto = new _cryptoSquare2['default']('s#$%^&plunk');
    expect(crypto.normalizePlaintext()).toEqual('splunk');
  });

  it('normalize numbers', function () {
    var crypto = new _cryptoSquare2['default']('1, 2, 3 GO!');
    expect(crypto.normalizePlaintext()).toEqual('123go');
  });

  it('size of small square', function () {
    var crypto = new _cryptoSquare2['default']('1234');
    expect(crypto.size()).toEqual(2);
  });

  it('size of small square with additional non-number chars', function () {
    var crypto = new _cryptoSquare2['default']('1 2 3 4');
    expect(crypto.size()).toEqual(2);
  });

  it('size of slightly larger square', function () {
    var crypto = new _cryptoSquare2['default']('123456789');
    expect(crypto.size()).toEqual(3);
  });

  it('size of non-perfect square', function () {
    var crypto = new _cryptoSquare2['default']('123456789abc');
    expect(crypto.size()).toEqual(4);
  });

  it('plain text segments', function () {
    var crypto = new _cryptoSquare2['default']('Never vex thine heart with idle woes');
    expect(crypto.plaintextSegments()).toEqual(['neverv', 'exthin', 'eheart', 'withid', 'lewoes']);
  });

  it('plain text segments', function () {
    var crypto = new _cryptoSquare2['default']('ZOMG! ZOMBIES!!!');
    expect(crypto.plaintextSegments()).toEqual(['zomg', 'zomb', 'ies']);
  });

  it('cipher text', function () {
    var crypto = new _cryptoSquare2['default']('Time is an illusion. Lunchtime doubly so.');
    expect(crypto.ciphertext()).toEqual('tasneyinicdsmiohooelntuillibsuuml');
  });

  it('cipher text', function () {
    var crypto = new _cryptoSquare2['default']('We all know interspecies romance is weird.');
    expect(crypto.ciphertext()).toEqual('wneiaweoreneawssciliprerlneoidktcms');
  });
});