'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _bracketPush = require('./bracket-push');

var _bracketPush2 = _interopRequireDefault(_bracketPush);

describe('bracket push', function () {
  it('checks for appropriate bracketing in a set of brackets', function () {
    expect((0, _bracketPush2['default'])('{}')).toEqual(true);
  });

  it('returns false for unclosed brackets', function () {
    expect((0, _bracketPush2['default'])('{{')).toEqual(false);
  });

  it('returns false if brackets are out of order', function () {
    expect((0, _bracketPush2['default'])('}{')).toEqual(false);
  });

  it('checks bracketing in more than one pair of brackets', function () {
    expect((0, _bracketPush2['default'])('{}[]')).toEqual(true);
  });

  it('checks bracketing in nested brackets', function () {
    expect((0, _bracketPush2['default'])('{[]}')).toEqual(true);
  });

  it('rejects brackets that are properly balanced but improperly nested', function () {
    expect((0, _bracketPush2['default'])('{[}]')).toEqual(false);
  });

  it('checks bracket closure with deeper nesting', function () {
    expect((0, _bracketPush2['default'])('{[)][]}')).toEqual(false);
  });

  it('checks bracket closure in a long string of brackets', function () {
    expect((0, _bracketPush2['default'])('{[]([()])}')).toEqual(true);
  });
});