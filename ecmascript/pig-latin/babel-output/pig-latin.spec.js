'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _pigLatin = require('./pig-latin');

var _pigLatin2 = _interopRequireDefault(_pigLatin);

describe('Pig Latin', function () {
  var translator = new _pigLatin2['default']();

  it('translates a word beginning with a', function () {
    expect(translator.translate('apple')).toEqual('appleay');
  });

  it('translates a word beginning with e', function () {
    expect(translator.translate('ear')).toEqual('earay');
  });

  it('translates a word beginning with p', function () {
    expect(translator.translate('pig')).toEqual('igpay');
  });

  it('translates a word beginning with k', function () {
    expect(translator.translate('koala')).toEqual('oalakay');
  });

  it('translates a word beginning with ch', function () {
    expect(translator.translate('chair')).toEqual('airchay');
  });

  it('translates a word beginning with qu', function () {
    expect(translator.translate('queen')).toEqual('eenquay');
  });

  it('translates a word with a consonant preceding qu', function () {
    expect(translator.translate('square')).toEqual('aresquay');
  });

  it('translates a word beginning with th', function () {
    expect(translator.translate('therapy')).toEqual('erapythay');
  });

  it('translates a word beginning with thr', function () {
    expect(translator.translate('thrush')).toEqual('ushthray');
  });

  it('translates a word beginning with sch', function () {
    expect(translator.translate('school')).toEqual('oolschay');
  });

  it('translates a phrase', function () {
    expect(translator.translate('quick fast run')).toEqual('ickquay astfay unray');
  });
});