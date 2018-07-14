'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _atbashCipher = require('./atbash-cipher');

var _atbashCipher2 = _interopRequireDefault(_atbashCipher);

describe('encode', function () {

  it('encodes no', function () {
    return expect(_atbashCipher2['default'].encode('no')).toEqual('ml');
  });

  it('encodes yes', function () {
    return expect(_atbashCipher2['default'].encode('yes')).toEqual('bvh');
  });

  it('encodes OMG', function () {
    return expect(_atbashCipher2['default'].encode('OMG')).toEqual('lnt');
  });

  it('encodes O M G', function () {
    return expect(_atbashCipher2['default'].encode('O M G')).toEqual('lnt');
  });

  it('encodes long words', function () {
    return expect(_atbashCipher2['default'].encode('mindblowingly')).toEqual('nrmwy oldrm tob');
  });

  it('encodes numbers', function () {
    return expect(_atbashCipher2['default'].encode('Testing, 1 2 3, testing.')).toEqual('gvhgr mt123 gvhgr mt');
  });

  it('encodes sentences', function () {
    return expect(_atbashCipher2['default'].encode('Truth is fiction.')).toEqual('gifgs rhurx grlm');
  });

  it('encodes all the things', function () {
    return expect(_atbashCipher2['default'].encode('The quick brown fox jumps over the lazy dog.')).toEqual('gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt');
  });
});