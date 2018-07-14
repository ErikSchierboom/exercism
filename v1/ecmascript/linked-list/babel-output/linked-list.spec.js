'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _linkedList = require('./linked-list');

var _linkedList2 = _interopRequireDefault(_linkedList);

describe('LinkedList', function () {
  it('add/extract elements to the end of the list with push/pop', function () {
    var list = new _linkedList2['default']();
    list.push(10);
    list.push(20);
    expect(list.pop()).toBe(20);
    expect(list.pop()).toBe(10);
  });
  it('extract elements from the beginning of the list with shift', function () {
    var list = new _linkedList2['default']();
    list.push(10);
    list.push(20);
    expect(list.shift()).toBe(10);
    expect(list.shift()).toBe(20);
  });
  it('add/extract elements from the beginning of the list with unshift/shift', function () {
    var list = new _linkedList2['default']();
    list.unshift(10);
    list.unshift(20);
    expect(list.shift()).toBe(20);
    expect(list.shift()).toBe(10);
  });
  it('unshift/pop', function () {
    var list = new _linkedList2['default']();
    list.unshift(10);
    list.unshift(20);
    expect(list.pop()).toBe(10);
    expect(list.pop()).toBe(20);
  });
  it('example', function () {
    var list = new _linkedList2['default']();
    list.push(10);
    list.push(20);
    expect(list.pop()).toBe(20);
    list.push(30);
    expect(list.shift()).toBe(10);
    list.unshift(40);
    list.push(50);
    expect(list.shift()).toBe(40);
    expect(list.pop()).toBe(50);
    expect(list.shift()).toBe(30);
  });
  it('can count its elements', function () {
    var list = new _linkedList2['default']();
    expect(list.count()).toBe(0);
    list.push(10);
    expect(list.count()).toBe(1);
    list.push(20);
    expect(list.count()).toBe(2);
  });
  it('sets head/tail after popping last element', function () {
    var list = new _linkedList2['default']();
    list.push(10);
    list.pop();
    list.unshift(20);
    expect(list.count()).toBe(1);
    expect(list.pop()).toBe(20);
  });
  it('sets head/tail after shifting last element', function () {
    var list = new _linkedList2['default']();
    list.unshift(10);
    list.shift();
    list.push(20);
    expect(list.count()).toBe(1);
    expect(list.shift()).toBe(20);
  });
  it('deletes the element with the specified value from the list', function () {
    var list = new _linkedList2['default']();
    list.push(10);
    list.push(20);
    list.push(30);
    list['delete'](20);
    expect(list.count()).toBe(2);
    expect(list.pop()).toBe(30);
    expect(list.shift()).toBe(10);
  });
  it('deletes the only element', function () {
    var list = new _linkedList2['default']();
    list.push(10);
    list['delete'](10);
    expect(list.count()).toBe(0);
  });
  it('delete does not modify the list if the element is not found', function () {
    var list = new _linkedList2['default']();
    list.push(10);
    list['delete'](20);
    expect(list.count()).toBe(1);
  });
});