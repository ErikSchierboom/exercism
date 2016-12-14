'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _binarySearchTree = require('./binary-search-tree');

var _binarySearchTree2 = _interopRequireDefault(_binarySearchTree);

function recordAllData(bst) {
  var out = [];

  bst.each(function (data) {
    return out.push(data);
  });

  return out;
}

describe('BinarySearchTree', function () {

  it('data is retained', function () {
    expect(new _binarySearchTree2['default'](4).data).toEqual(4);
  });

  it('inserting less', function () {
    var four = new _binarySearchTree2['default'](4);
    four.insert(2);

    expect(four.data).toEqual(4);
    expect(four.left.data).toEqual(2);
  });

  it('inserting same', function () {
    var four = new _binarySearchTree2['default'](4);
    four.insert(4);

    expect(four.data).toEqual(4);
    expect(four.left.data).toEqual(4);
  });

  it('inserting right', function () {
    var four = new _binarySearchTree2['default'](4);
    four.insert(5);

    expect(four.data).toEqual(4);
    expect(four.right.data).toEqual(5);
  });

  it('complex tree', function () {
    var four = new _binarySearchTree2['default'](4);
    four.insert(2);
    four.insert(6);
    four.insert(1);
    four.insert(3);
    four.insert(7);
    four.insert(5);

    expect(four.data).toEqual(4);
    expect(four.left.data).toEqual(2);
    expect(four.left.left.data).toEqual(1);
    expect(four.left.right.data).toEqual(3);
    expect(four.right.data).toEqual(6);
    expect(four.right.left.data).toEqual(5);
    expect(four.right.right.data).toEqual(7);
  });

  it('iterating one element', function () {
    expect(recordAllData(new _binarySearchTree2['default'](4))).toEqual([4]);
  });

  it('iterating over smaller element', function () {
    var four = new _binarySearchTree2['default'](4);
    four.insert(2);

    expect(recordAllData(four)).toEqual([2, 4]);
  });

  it('iterating over larger element', function () {
    var four = new _binarySearchTree2['default'](4);
    four.insert(5);

    expect(recordAllData(four)).toEqual([4, 5]);
  });

  it('iterating over complex tree', function () {
    var four = new _binarySearchTree2['default'](4);
    four.insert(2);
    four.insert(1);
    four.insert(3);
    four.insert(6);
    four.insert(7);
    four.insert(5);

    expect(recordAllData(four)).toEqual([1, 2, 3, 4, 5, 6, 7]);
  });
});