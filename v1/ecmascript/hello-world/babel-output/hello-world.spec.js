'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _helloWorld = require('./hello-world');

var _helloWorld2 = _interopRequireDefault(_helloWorld);

describe('Hello World', function () {
  var helloWorld = new _helloWorld2['default']();

  it('says hello world with no name', function () {
    expect(helloWorld.hello()).toEqual('Hello, World!');
  });

  it('says hello to bob', function () {
    expect(helloWorld.hello('Bob')).toEqual('Hello, Bob!');
  });

  it('says hello to sally', function () {
    expect(helloWorld.hello('Sally')).toEqual('Hello, Sally!');
  });
});