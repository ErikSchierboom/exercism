'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _gigasecond = require('./gigasecond');

var _gigasecond2 = _interopRequireDefault(_gigasecond);

describe('Gigasecond', function () {

  it('tells a gigasecond anniversary since midnight', function () {
    var gs = new _gigasecond2['default'](new Date(Date.UTC(2015, 8, 14)));
    var expectedDate = new Date(Date.UTC(2047, 4, 23, 1, 46, 40));
    expect(gs.date()).toEqual(expectedDate);
  });

  it('tells the anniversary is next day when you are born at night', function () {
    var gs = new _gigasecond2['default'](new Date(Date.UTC(2015, 8, 14, 23, 59, 59)));
    var expectedDate = new Date(Date.UTC(2047, 4, 24, 1, 46, 39));
    expect(gs.date()).toEqual(expectedDate);
  });

  it('even works before 1970 (beginning of Unix epoch)', function () {
    var gs = new _gigasecond2['default'](new Date(Date.UTC(1959, 6, 19, 5, 13, 45)));
    var expectedDate = new Date(Date.UTC(1991, 2, 27, 7, 0, 25));
    expect(gs.date()).toEqual(expectedDate);
  });

  it('make sure calling "date" doesn\'t mutate value', function () {
    var gs = new _gigasecond2['default'](new Date(Date.UTC(1959, 6, 19, 5, 13, 45)));
    var expectedDate = new Date(Date.UTC(1991, 2, 27, 7, 0, 25));
    gs.date();
    expect(gs.date()).toEqual(expectedDate);
  });
});