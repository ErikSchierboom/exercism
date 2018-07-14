'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _isogramJs = require('./isogram.js');

var _isogramJs2 = _interopRequireDefault(_isogramJs);

describe('Isogram Test Suite', function () {
  it('duplicates', function () {
    var word = new _isogramJs2['default']('duplicates');

    expect(word.isIsogram()).toEqual(true);
  });

  it('eleven', function () {
    var word = new _isogramJs2['default']('eleven');

    expect(word.isIsogram()).toEqual(false);
  });

  it('subdermatoglyphic', function () {
    var word = new _isogramJs2['default']('subdermatoglyphic');

    expect(word.isIsogram()).toEqual(true);
  });

  it('Alphabet', function () {
    var word = new _isogramJs2['default']('Alphabet');

    expect(word.isIsogram()).toEqual(false);
  });

  it('thumbscrew-japingly', function () {
    var word = new _isogramJs2['default']('thumbscrew-japingly');

    expect(word.isIsogram()).toEqual(true);
  });

  it('Hjelmqvist-Gryb-Zock-Pfund-Wax', function () {
    var word = new _isogramJs2['default']('Hjelmqvist-Gryb-Zock-Pfund-Wax');

    expect(word.isIsogram()).toEqual(true);
  });

  it('Heizölrückstoßabdämpfung', function () {
    var word = new _isogramJs2['default']('Heizölrückstoßabdämpfung');

    expect(word.isIsogram()).toEqual(true);
  });

  it('the quick brown fox', function () {
    var word = new _isogramJs2['default']('the quick brown fox');

    expect(word.isIsogram()).toEqual(false);
  });

  it('Emily Jung Schwartzkopf', function () {
    var word = new _isogramJs2['default']('Emily Jung Schwartzkopf');

    expect(word.isIsogram()).toEqual(true);
  });

  it('éléphant', function () {
    var word = new _isogramJs2['default']('éléphant');

    expect(word.isIsogram()).toEqual(false);
  });
});