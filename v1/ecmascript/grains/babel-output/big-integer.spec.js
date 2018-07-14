'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _bigInteger = require('./big-integer');

var _bigInteger2 = _interopRequireDefault(_bigInteger);

describe('The big-integer module\'s returned object', function () {
  var bigI = undefined;

  beforeEach(function () {
    bigI = (0, _bigInteger2['default'])(42);
  });

  afterEach(function () {
    bigI = null;
  });

  it('is not a number', function () {
    expect(typeof 42).toBe('number');
    expect(typeof bigI).not.toBe('number');
    expect(typeof bigI).toBe('object');
  });

  it('can be compared to a stringified number by calling \'.toString()\'', function () {
    expect(bigI).not.toBe(42);
    expect(bigI).not.toBe('42');
    expect(bigI.toString()).toBe('42');
    // NOTE:
    // The '==' operator calls '.toString()' here in order to compare.
    expect(bigI == '42').toBe(true);
    // While the line above is easier to write and read, we will use the
    // 'expect(bigI.toString()).toBe(expected)' way so that test failure
    // messages will be more informative. Eg,
    // "Expected '84' to be '42'." instead of
    // "Expected false to be true."
  });

  it('is immutable', function () {
    bigI.add(10);
    expect(bigI.toString()).toBe('42');
    bigI.subtract(10);
    expect(bigI.toString()).toBe('42');
  });

  it('can add', function () {
    bigI = bigI.add(42);

    expect(bigI.toString()).toBe('84');
  });

  it('can perform power operations', function () {
    bigI = (0, _bigInteger2['default'])(10);
    bigI = bigI.pow(2);
    expect(bigI.toString()).toBe('100');
  });

  // ...see the official docs for more info, if you want.
  // The "Methods" section of the README is especially useful:
  //
  // https://github.com/peterolson/BigInteger.js#methods
});