'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _twoBucket = require('./two-bucket');

var _twoBucket2 = _interopRequireDefault(_twoBucket);

describe('TwoBucket', function () {

  describe('works for input of 3, 5, 1', function () {
    var buckOne = 3;
    var buckTwo = 5;
    var goal = 1;

    it('starting with bucket one', function () {
      var starterBuck = 'one'; //indicates which bucket to fill first
      var twoBucket = new _twoBucket2['default'](buckOne, buckTwo, goal, starterBuck);
      expect(twoBucket.moves()).toEqual(4); //includes the first fill
      expect(twoBucket.goalBucket).toEqual('one'); //which bucket should end up with the desired # of liters
      expect(twoBucket.otherBucket).toEqual(5); //leftover value in the "other" bucket once the goal has been reached
    });

    it('starting with bucket two', function () {
      var starterBuck = 'two';
      var twoBucket = new _twoBucket2['default'](buckOne, buckTwo, goal, starterBuck);
      expect(twoBucket.moves()).toEqual(8);
      expect(twoBucket.goalBucket).toEqual('two');
      expect(twoBucket.otherBucket).toEqual(3);
    });
  });

  describe('works for input of 7, 11, 2', function () {
    var buckOne = 7;
    var buckTwo = 11;
    var goal = 2;

    it('starting with bucket one', function () {
      var starterBuck = 'one';
      var twoBucket = new _twoBucket2['default'](buckOne, buckTwo, goal, starterBuck);
      expect(twoBucket.moves()).toEqual(14);
      expect(twoBucket.goalBucket).toEqual('one');
      expect(twoBucket.otherBucket).toEqual(11);
    });

    it('starting with bucket two', function () {
      var starterBuck = 'two';
      var twoBucket = new _twoBucket2['default'](buckOne, buckTwo, goal, starterBuck);
      expect(twoBucket.moves()).toEqual(18);
      expect(twoBucket.goalBucket).toEqual('two');
      expect(twoBucket.otherBucket).toEqual(7);
    });
  });
});