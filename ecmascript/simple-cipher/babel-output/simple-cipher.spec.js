'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _simpleCipher = require('./simple-cipher');

var _simpleCipher2 = _interopRequireDefault(_simpleCipher);

describe('Random key cipher', function () {
  var cipher = new _simpleCipher2['default']();

  it('has a key made of letters', function () {
    expect(cipher.key).toMatch(/^[a-z]+$/);
  });

  // Here we take advantage of the fact that plaintext of "aaa..."
  // outputs the key. This is a critical problem with shift ciphers, some
  // characters will always output the key verbatim.
  it('can encode', function () {
    expect(cipher.encode('aaaaaaaaaa')).toEqual(cipher.key.substr(0, 10));
  });

  it('can decode', function () {
    expect(cipher.decode(cipher.key.substr(0, 10))).toEqual('aaaaaaaaaa');
  });

  it('is reversible', function () {
    var plaintext = 'abcdefghij';
    expect(cipher.decode(cipher.encode(plaintext))).toEqual(plaintext);
  });
});

describe('Incorrect key cipher', function () {
  it('throws an error with an all caps key', function () {
    expect(function () {
      new _simpleCipher2['default']('ABCDEF');
    }).toThrow(new Error('Bad key'));
  });

  it('throws an error with a numeric key', function () {
    expect(function () {
      new _simpleCipher2['default']('12345');
    }).toThrow(new Error('Bad key'));
  });

  it('throws an error with an empty key', function () {
    expect(function () {
      new _simpleCipher2['default']('');
    }).toThrow(new Error('Bad key'));
  });
});

describe('Substitution cipher', function () {
  var key = 'abcdefghij';
  var cipher = new _simpleCipher2['default'](key);

  it('keeps the submitted key', function () {
    expect(cipher.key).toEqual(key);
  });

  it('can encode', function () {
    expect(cipher.encode('aaaaaaaaaa')).toEqual('abcdefghij');
  });

  it('can decode', function () {
    expect(cipher.decode('abcdefghij')).toEqual('aaaaaaaaaa');
  });

  it('is reversible', function () {
    expect(cipher.decode(cipher.encode('abcdefghij'))).toEqual('abcdefghij');
  });

  it(': double shift encode', function () {
    expect(new _simpleCipher2['default']('iamapandabear').encode('iamapandabear')).toEqual('qayaeaagaciai');
  });

  it('can wrap', function () {
    expect(cipher.encode('zzzzzzzzzz')).toEqual('zabcdefghi');
  });
});