'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _scrabbleScore = require('./scrabble-score');

var _scrabbleScore2 = _interopRequireDefault(_scrabbleScore);

describe('Scrabble', function () {
  it('scores an empty word as zero', function () {
    return expect((0, _scrabbleScore2['default'])('')).toEqual(0);
  });

  it('scores a null as zero', function () {
    return expect((0, _scrabbleScore2['default'])(null)).toEqual(0);
  });

  it('scores a very short word', function () {
    return expect((0, _scrabbleScore2['default'])('a')).toEqual(1);
  });

  it('scores the word by the number of letters', function () {
    return expect((0, _scrabbleScore2['default'])('street')).toEqual(6);
  });

  it('scores more complicated words with more', function () {
    return expect((0, _scrabbleScore2['default'])('quirky')).toEqual(22);
  });

  it('scores case insensitive words', function () {
    return expect((0, _scrabbleScore2['default'])('OXYPHENBUTAZONE')).toEqual(41);
  });
});