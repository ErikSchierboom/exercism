import circularBuffer from './circular-buffer';
import { bufferFullException as bufferFullException } from './circular-buffer';
import { bufferEmptyException as bufferEmptyException } from './circular-buffer';


describe('CircularBuffer', () => {

  it('reading an empty buffer throws a BufferEmptyException', () => {
    const buffer = circularBuffer(1);
    expect(()=>buffer.read()).toThrow(bufferEmptyException());
  });

  it('write and read back one item', () => {
    const buffer = circularBuffer(1);
    buffer.write('1');
    expect(buffer.read()).toBe('1');
    expect(()=>buffer.read()).toThrow(bufferEmptyException());
  });

  it('write and read back multiple items', () => {
    const buffer = circularBuffer(2);
    buffer.write('1');
    buffer.write('2');
    expect(buffer.read()).toBe('1');
    expect(buffer.read()).toBe('2');
    expect(()=>buffer.read()).toThrow(bufferEmptyException());
  });

  it('clearing a buffer', () => {
    const buffer = circularBuffer(2);
    buffer.write('1');
    buffer.write('2');
    buffer.clear();
    expect(()=>buffer.read()).toThrow(bufferEmptyException());
    buffer.write('3');
    buffer.write('4');
    expect(buffer.read()).toBe('3');
    expect(buffer.read()).toBe('4');
  });

  it('alternate write and read', () => {
    const buffer = circularBuffer(2);
    buffer.write('1');
    expect(buffer.read()).toBe('1');
    buffer.write('2');
    expect(buffer.read()).toBe('2');
  });

  it('reads back oldest item', () => {
    const buffer = circularBuffer(3);
    buffer.write('1');
    buffer.write('2');
    buffer.read();
    buffer.write('3');
    expect(buffer.read()).toBe('2');
    expect(buffer.read()).toBe('3');
  });

  it('writes of undefined or null don\'t occupy buffer', () => {
    const buffer = circularBuffer(3);
    buffer.write(null);
    buffer.write(undefined);
    [1,2,3].map(i => buffer.write(i.toString()));
    expect(buffer.read()).toBe('1');
  });

  it('writing to a full buffer throws a BufferFullException', () => {
    const buffer = circularBuffer(2);
    buffer.write('1');
    buffer.write('2');
    expect(() => buffer.write('A')).toThrow(bufferFullException());
  });

  it('forced writes over write oldest item in a full buffer', () => {
    const buffer = circularBuffer(2);
    buffer.write('1');
    buffer.write('2');
    buffer.forceWrite('A');
    expect(buffer.read()).toBe('2');
    expect(buffer.read()).toBe('A');
    expect(()=>buffer.read()).toThrow(bufferEmptyException());
  });

  it('forced writes act like write in a non-full buffer', () => {
    const buffer = circularBuffer(2);
    buffer.write('1');
    buffer.forceWrite('2');
    expect(buffer.read()).toBe('1');
    expect(buffer.read()).toBe('2');
    expect(()=>buffer.read()).toThrow(bufferEmptyException());
  });

  it('alternate force write and read into full buffer', () => {
    const buffer = circularBuffer(5);
    [1,2,3].map(i => buffer.write(i.toString()));
    buffer.read();
    buffer.read();
    buffer.write('4');
    buffer.read();
    [5,6,7,8].map(i => buffer.write(i.toString()));
    buffer.forceWrite('A');
    buffer.forceWrite('B');
    expect(buffer.read()).toBe('6');
    expect(buffer.read()).toBe('7');
    expect(buffer.read()).toBe('8');
    expect(buffer.read()).toBe('A');
    expect(buffer.read()).toBe('B');
    expect(()=>buffer.read()).toThrow(bufferEmptyException());
  });

});
