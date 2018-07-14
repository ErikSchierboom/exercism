'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _customSet = require('./custom-set');

var _customSet2 = _interopRequireDefault(_customSet);

describe('CustomSet', function () {

  it('can delete elements', function () {
    var expected = new _customSet2['default']([1, 3]);
    var actual = new _customSet2['default']([3, 2, 1])['delete'](2);
    expect(actual.eql(expected)).toBe(true);

    var expected2 = new _customSet2['default']([1, 2, 3]);
    var actual2 = new _customSet2['default']([3, 2, 1])['delete'](4);
    expect(actual2.eql(expected2)).toBe(true);
  });

  it('can check for difference', function () {
    var expected = new _customSet2['default']([1, 3]);
    var actual = new _customSet2['default']([3, 2, 1]).difference(new _customSet2['default']([2, 4]));
    expect(actual.eql(expected)).toBe(true);
    var expected2 = new _customSet2['default']([1, 2, 3]);
    var actual2 = new _customSet2['default']([1, 2, 3]).difference(new _customSet2['default']([4]));
    expect(actual2.eql(expected2)).toBe(true);
  });

  it('can test disjoint', function () {
    var actual = new _customSet2['default']([1, 2]).disjoint(new _customSet2['default']([3, 4]));
    expect(actual).toBe(true);
    var actual2 = new _customSet2['default']([1, 2]).disjoint(new _customSet2['default']([2, 3]));
    expect(actual2).toBe(false);
    var actual3 = new _customSet2['default']().disjoint(new _customSet2['default']());
    expect(actual3).toBe(true);
  });

  it('can be emptied', function () {
    var actual = new _customSet2['default']([1, 2]).empty();
    var expected = new _customSet2['default']();
    expect(actual.eql(expected)).toBe(true);
    var actual2 = new _customSet2['default']().empty();
    var expected2 = new _customSet2['default']();
    expect(actual2.eql(expected2)).toBe(true);
  });

  it('can check for intersection', function () {
    var actual = new _customSet2['default'](['a', 'b', 'c']).intersection(new _customSet2['default'](['a', 'c', 'd']));
    var expected = new _customSet2['default'](['a', 'c']);
    expect(actual.eql(expected)).toBe(true);

    var actual2 = new _customSet2['default']([1, 2, 3]).intersection(new _customSet2['default']([3, 5, 4]));
    var expected2 = new _customSet2['default']([3]);
    expect(actual2.eql(expected2)).toBe(true);
  });

  it('can test for a member', function () {
    var actual = new _customSet2['default']([1, 2, 3]).member(2);
    expect(actual).toBe(true);
    var actual2 = new _customSet2['default']([1, 2, 3]).member(4);
    expect(actual2).toBe(false);
  });

  it('can add a member with put', function () {
    var actual = new _customSet2['default']([1, 2, 4]).put(3);
    var expected = new _customSet2['default']([1, 2, 3, 4]);
    expect(actual.eql(expected)).toBe(true);
    var actual2 = new _customSet2['default']([1, 2, 3]).put(3);
    var expected2 = new _customSet2['default']([1, 2, 3]);
    expect(actual2.eql(expected2)).toBe(true);
  });

  it('knows its size', function () {
    var actual = new _customSet2['default']().size();
    expect(actual).toBe(0);
    var actual2 = new _customSet2['default']([1, 2, 3]).size();
    expect(actual2).toBe(3);
    var actual3 = new _customSet2['default']([1, 2, 3, 2]).size();
    expect(actual3).toBe(3);
  });

  it('can test for subsets', function () {
    var actual = new _customSet2['default']([1, 2, 3]).subset(new _customSet2['default']([1, 2, 3]));
    expect(actual).toBe(true);
    var actual2 = new _customSet2['default']([4, 1, 2, 3]).subset(new _customSet2['default']([1, 2, 3]));
    expect(actual2).toBe(true);
    var actual3 = new _customSet2['default']([4, 1, 3]).subset(new _customSet2['default']([1, 2, 3]));
    expect(actual3).toBe(false);
    var actual4 = new _customSet2['default']([4, 1, 3]).subset(new _customSet2['default']());
    expect(actual4).toBe(true);
    var actual5 = new _customSet2['default']().subset(new _customSet2['default']());
    expect(actual5).toBe(true);
  });

  it('can give back a list', function () {
    var actual = new _customSet2['default']().toList();
    var expected = [];
    expect(actual.sort()).toEqual(expected);
    var actual2 = new _customSet2['default']([3, 1, 2]).toList();
    var expected2 = [1, 2, 3];
    expect(actual2.sort()).toEqual(expected2);
    var actual3 = new _customSet2['default']([3, 1, 2, 1]).toList();
    var expected3 = [1, 2, 3];
    expect(actual3.sort()).toEqual(expected3);
  });

  it('can test for union', function () {
    var actual = new _customSet2['default']([1, 3]).union(new _customSet2['default']([2]));
    var expected = new _customSet2['default']([3, 2, 1]);
    expect(actual.eql(expected)).toBe(true);
    var actual2 = new _customSet2['default']([1, 3]).union(new _customSet2['default']([2, 3]));
    var expected2 = new _customSet2['default']([3, 2, 1]);
    expect(actual2.eql(expected2)).toBe(true);
    var actual3 = new _customSet2['default']([1, 3]).union(new _customSet2['default']());
    var expected3 = new _customSet2['default']([3, 1]);
    expect(actual3.eql(expected3)).toBe(true);
    var actual4 = new _customSet2['default']().union(new _customSet2['default']());
    var expected4 = new _customSet2['default']();
    expect(actual4.eql(expected4)).toBe(true);
  });
});