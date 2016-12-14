'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _matrix = require('./matrix');

var _matrix2 = _interopRequireDefault(_matrix);

describe('Matrix', function () {

  it('can extract a row', function () {
    expect(new _matrix2['default']('1 2\n10 20').rows[0]).toEqual([1, 2]);
  });

  it('can extract the other row', function () {
    expect(new _matrix2['default']('9 8 7\n19 18 17').rows[1]).toEqual([19, 18, 17]);
  });

  it('can extract a column', function () {
    expect(new _matrix2['default']('89 1903 3\n18 3 1\n9 4 800').columns[1]).toEqual([1903, 3, 4]);
  });
});