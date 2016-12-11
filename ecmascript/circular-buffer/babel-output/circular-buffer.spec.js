'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _circularBuffer = require('./circular-buffer');

var _circularBuffer2 = _interopRequireDefault(_circularBuffer);

describe('CircularBuffer', function () {

  it('reading an empty buffer throws a BufferEmptyException', function () {
    var buffer = (0, _circularBuffer2['default'])(1);
    expect(function () {
      return buffer.read();
    }).toThrow((0, _circularBuffer.bufferEmptyException)());
  });

  it('write and read back one item', function () {
    var buffer = (0, _circularBuffer2['default'])(1);
    buffer.write('1');
    expect(buffer.read()).toBe('1');
    expect(function () {
      return buffer.read();
    }).toThrow((0, _circularBuffer.bufferEmptyException)());
  });

  it('write and read back multiple items', function () {
    var buffer = (0, _circularBuffer2['default'])(2);
    buffer.write('1');
    buffer.write('2');
    expect(buffer.read()).toBe('1');
    expect(buffer.read()).toBe('2');
    expect(function () {
      return buffer.read();
    }).toThrow((0, _circularBuffer.bufferEmptyException)());
  });

  it('clearing a buffer', function () {
    var buffer = (0, _circularBuffer2['default'])(2);
    buffer.write('1');
    buffer.write('2');
    buffer.clear();
    expect(function () {
      return buffer.read();
    }).toThrow((0, _circularBuffer.bufferEmptyException)());
    buffer.write('3');
    buffer.write('4');
    expect(buffer.read()).toBe('3');
    expect(buffer.read()).toBe('4');
  });

  it('alternate write and read', function () {
    var buffer = (0, _circularBuffer2['default'])(2);
    buffer.write('1');
    expect(buffer.read()).toBe('1');
    buffer.write('2');
    expect(buffer.read()).toBe('2');
  });

  it('reads back oldest item', function () {
    var buffer = (0, _circularBuffer2['default'])(3);
    buffer.write('1');
    buffer.write('2');
    buffer.read();
    buffer.write('3');
    expect(buffer.read()).toBe('2');
    expect(buffer.read()).toBe('3');
  });

  it('writes of undefined or null don\'t occupy buffer', function () {
    var buffer = (0, _circularBuffer2['default'])(3);
    buffer.write(null);
    buffer.write(undefined);
    [1, 2, 3].map(function (i) {
      return buffer.write(i.toString());
    });
    expect(buffer.read()).toBe('1');
  });

  it('writing to a full buffer throws a BufferFullException', function () {
    var buffer = (0, _circularBuffer2['default'])(2);
    buffer.write('1');
    buffer.write('2');
    expect(function () {
      return buffer.write('A');
    }).toThrow((0, _circularBuffer.bufferFullException)());
  });

  it('forced writes over write oldest item in a full buffer', function () {
    var buffer = (0, _circularBuffer2['default'])(2);
    buffer.write('1');
    buffer.write('2');
    buffer.forceWrite('A');
    expect(buffer.read()).toBe('2');
    expect(buffer.read()).toBe('A');
    expect(function () {
      return buffer.read();
    }).toThrow((0, _circularBuffer.bufferEmptyException)());
  });

  it('forced writes act like write in a non-full buffer', function () {
    var buffer = (0, _circularBuffer2['default'])(2);
    buffer.write('1');
    buffer.forceWrite('2');
    expect(buffer.read()).toBe('1');
    expect(buffer.read()).toBe('2');
    expect(function () {
      return buffer.read();
    }).toThrow((0, _circularBuffer.bufferEmptyException)());
  });

  it('alternate force write and read into full buffer', function () {
    var buffer = (0, _circularBuffer2['default'])(5);
    [1, 2, 3].map(function (i) {
      return buffer.write(i.toString());
    });
    buffer.read();
    buffer.read();
    buffer.write('4');
    buffer.read();
    [5, 6, 7, 8].map(function (i) {
      return buffer.write(i.toString());
    });
    buffer.forceWrite('A');
    buffer.forceWrite('B');
    expect(buffer.read()).toBe('6');
    expect(buffer.read()).toBe('7');
    expect(buffer.read()).toBe('8');
    expect(buffer.read()).toBe('A');
    expect(buffer.read()).toBe('B');
    expect(function () {
      return buffer.read();
    }).toThrow((0, _circularBuffer.bufferEmptyException)());
  });
});