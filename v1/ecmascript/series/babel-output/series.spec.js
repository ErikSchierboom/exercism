'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _series = require('./series');

var _series2 = _interopRequireDefault(_series);

describe('Series', function () {

  it('has digits (short)', function () {
    expect(new _series2['default']('01234').digits).toEqual([0, 1, 2, 3, 4]);
  });

  it('has digits (long)', function () {
    expect(new _series2['default']('0123456789').digits).toEqual([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
  });

  it('keeps the digit order if reversed', function () {
    expect(new _series2['default']('9876543210').digits).toEqual([9, 8, 7, 6, 5, 4, 3, 2, 1, 0]);
  });

  it('keeps arbitrary digit order', function () {
    expect(new _series2['default']('936923468').digits).toEqual([9, 3, 6, 9, 2, 3, 4, 6, 8]);
  });

  it('can slice by 1', function () {
    expect(new _series2['default']('01234').slices(1)).toEqual([[0], [1], [2], [3], [4]]);
  });

  it('can slice by 2', function () {
    expect(new _series2['default']('98273463').slices(2)).toEqual([[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]);
  });

  it('can slice by 3', function () {
    expect(new _series2['default']('01234').slices(3)).toEqual([[0, 1, 2], [1, 2, 3], [2, 3, 4]]);
  });

  it('can slice by 3 with duplicate digits', function () {
    expect(new _series2['default']('31001').slices(3)).toEqual([[3, 1, 0], [1, 0, 0], [0, 0, 1]]);
  });

  it('can slice by 4', function () {
    expect(new _series2['default']('91274').slices(4)).toEqual([[9, 1, 2, 7], [1, 2, 7, 4]]);
  });

  it('can slice by 5', function () {
    expect(new _series2['default']('81228').slices(5)).toEqual([[8, 1, 2, 2, 8]]);
  });

  it('throws an error if not enough digits to slice', function () {
    expect(function () {
      new _series2['default']('01032987583').slices(12);
    }).toThrow(new Error('Slice size is too big.'));
  });
});