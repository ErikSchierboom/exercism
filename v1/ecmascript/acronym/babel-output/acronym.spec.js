'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _acronym = require('./acronym');

var _acronym2 = _interopRequireDefault(_acronym);

describe('Acronyms are produced from', function () {
  it('title cased phrases', function () {
    expect(_acronym2['default'].parse('Portable Network Graphics')).toEqual('PNG');
  });

  it('other title cased phrases', function () {
    expect(_acronym2['default'].parse('Ruby on Rails')).toEqual('ROR');
  });

  it('inconsistently cased phrases', function () {
    expect(_acronym2['default'].parse('HyperText Markup Language')).toEqual('HTML');
  });

  it('phrases with punctuation', function () {
    expect(_acronym2['default'].parse('First In, First Out')).toEqual('FIFO');
  });

  it('other phrases with punctuation', function () {
    expect(_acronym2['default'].parse('PHP: Hypertext Preprocessor')).toEqual('PHP');
  });

  it('phrases with punctuation and sentence casing', function () {
    expect(_acronym2['default'].parse('Complementary metal-oxide semiconductor')).toEqual('CMOS');
  });
});