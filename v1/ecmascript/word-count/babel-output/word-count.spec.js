'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _wordCount = require('./word-count');

var _wordCount2 = _interopRequireDefault(_wordCount);

describe('words()', function () {
  var words = new _wordCount2['default']();

  it('counts one word', function () {
    var expectedCounts = { word: 1 };
    expect(words.count('word')).toEqual(expectedCounts);
  });

  it('counts one of each', function () {
    var expectedCounts = { one: 1, of: 1, each: 1 };
    expect(words.count('one of each')).toEqual(expectedCounts);
  });

  it('counts multiple occurrences', function () {
    var expectedCounts = { one: 1, fish: 4, two: 1, red: 1, blue: 1 };
    expect(words.count('one fish two fish red fish blue fish')).toEqual(expectedCounts);
  });

  it('includes punctuation', function () {
    var expectedCounts = { car: 1, ':': 2, carpet: 1, as: 1, java: 1, 'javascript!!&@$%^&': 1 };
    expect(words.count('car : carpet as java : javascript!!&@$%^&')).toEqual(expectedCounts);
  });

  it('includes numbers', function () {
    var expectedCounts = { testing: 2, 1: 1, 2: 1 };
    expect(words.count('testing 1 2 testing')).toEqual(expectedCounts);
  });

  it('normalizes to lower case', function () {
    var expectedCounts = { go: 3 };
    expect(words.count('go Go GO')).toEqual(expectedCounts);
  });

  it('counts properly international characters', function () {
    var expectedCounts = { '¡hola!': 1, '¿qué': 1, 'tal?': 1, 'привет!': 1 };
    expect(words.count('¡Hola! ¿Qué tal? Привет!')).toEqual(expectedCounts);
  });

  it('counts multiline', function () {
    var expectedCounts = { hello: 1, world: 1 };
    expect(words.count('hello\nworld')).toEqual(expectedCounts);
  });

  it('counts tabs', function () {
    var expectedCounts = { hello: 1, world: 1 };
    expect(words.count('hello\tworld')).toEqual(expectedCounts);
  });

  it('counts multiple spaces as one', function () {
    var expectedCounts = { hello: 1, world: 1 };
    expect(words.count('hello  world')).toEqual(expectedCounts);
  });

  it('does not count leading or trailing whitespace', function () {
    var expectedCounts = { introductory: 1, course: 1 };
    expect(words.count('\t\tIntroductory Course      ')).toEqual(expectedCounts);
  });

  it('handles properties that exist on Object’s prototype', function () {
    var expectedCounts = { reserved: 1, words: 1, like: 1, constructor: 1, and: 1, tostring: 1, 'ok?': 1 };
    expect(words.count('reserved words like constructor and toString ok?')).toEqual(expectedCounts);
  });
});