'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _clock = require('./clock');

var _clock2 = _interopRequireDefault(_clock);

describe('Clock', function () {

  describe('Creating a new clock with an initial time', function () {

    it('on the hour', function () {
      expect((0, _clock2['default'])(8).toString()).toEqual('08:00');
    });

    it('past the hour', function () {
      expect((0, _clock2['default'])(11, 9).toString()).toEqual('11:09');
    });

    it('midnight is zero hours', function () {
      expect((0, _clock2['default'])(24, 0).toString()).toEqual('00:00');
    });

    it('hour rolls over', function () {
      expect((0, _clock2['default'])(25, 0).toString()).toEqual('01:00');
    });

    it('hour rolls over continuously', function () {
      expect((0, _clock2['default'])(100, 0).toString()).toEqual('04:00');
    });

    it('sixty minutes is next hour', function () {
      expect((0, _clock2['default'])(1, 60).toString()).toEqual('02:00');
    });

    it('minutes roll over', function () {
      expect((0, _clock2['default'])(0, 160).toString()).toEqual('02:40');
    });

    it('minutes roll over continuously', function () {
      expect((0, _clock2['default'])(0, 1723).toString()).toEqual('04:43');
    });

    it('hour and minutes roll over', function () {
      expect((0, _clock2['default'])(25, 160).toString()).toEqual('03:40');
    });

    it('hour and minutes roll over continuously', function () {
      expect((0, _clock2['default'])(201, 3001).toString()).toEqual('11:01');
    });

    it('hour and minutes roll over to exactly midnight', function () {
      expect((0, _clock2['default'])(72, 8640).toString()).toEqual('00:00');
    });

    it('negative hour', function () {
      expect((0, _clock2['default'])(-1, 15).toString()).toEqual('23:15');
    });

    it('negative hour rolls over', function () {
      expect((0, _clock2['default'])(-25, 0).toString()).toEqual('23:00');
    });

    it('negative hour rolls over continuously', function () {
      expect((0, _clock2['default'])(-91, 0).toString()).toEqual('05:00');
    });

    it('negative minutes', function () {
      expect((0, _clock2['default'])(1, -40).toString()).toEqual('00:20');
    });

    it('negative minutes rolls over', function () {
      expect((0, _clock2['default'])(1, -160).toString()).toEqual('22:20');
    });

    it('negative minutes rolls over continuously', function () {
      expect((0, _clock2['default'])(1, -4820).toString()).toEqual('16:40');
    });

    it('negative hour and minutes both roll over', function () {
      expect((0, _clock2['default'])(-25, -160).toString()).toEqual('20:20');
    });

    it('negative hour and minutes both roll over continuously', function () {
      expect((0, _clock2['default'])(-121, -5810).toString()).toEqual('22:10');
    });

    describe('Adding and subtracting minutes', function () {

      it('add minutes', function () {
        expect((0, _clock2['default'])(10, 0).plus(3).toString()).toEqual('10:03');
      });

      it('add no minutes', function () {
        expect((0, _clock2['default'])(6, 41).plus(0).toString()).toEqual('06:41');
      });

      it('add to next hour', function () {
        expect((0, _clock2['default'])(0, 45).plus(40).toString()).toEqual('01:25');
      });

      it('add more than one hour', function () {
        expect((0, _clock2['default'])(10, 0).plus(61).toString()).toEqual('11:01');
      });

      it('add more than two hours with carry', function () {
        expect((0, _clock2['default'])(0, 45).plus(160).toString()).toEqual('03:25');
      });

      it('add across midnight', function () {
        expect((0, _clock2['default'])(23, 59).plus(2).toString()).toEqual('00:01');
      });

      it('add more than one day (1500 min = 25 hrs)', function () {
        expect((0, _clock2['default'])(5, 32).plus(1500).toString()).toEqual('06:32');
      });

      it('add more than two days', function () {
        expect((0, _clock2['default'])(1, 1).plus(3500).toString()).toEqual('11:21');
      });

      it('subtract minutes', function () {
        expect((0, _clock2['default'])(10, 3).minus(3).toString()).toEqual('10:00');
      });

      it('subtract to previous hour', function () {
        expect((0, _clock2['default'])(10, 3).minus(30).toString()).toEqual('09:33');
      });

      it('subtract more than an hour', function () {
        expect((0, _clock2['default'])(10, 3).minus(70).toString()).toEqual('08:53');
      });

      it('subtract across midnight', function () {
        expect((0, _clock2['default'])(0, 3).minus(4).toString()).toEqual('23:59');
      });

      it('subtract more than two hours', function () {
        expect((0, _clock2['default'])(0, 0).minus(160).toString()).toEqual('21:20');
      });

      it('subtract more than two hours with borrow', function () {
        expect((0, _clock2['default'])(6, 15).minus(160).toString()).toEqual('03:35');
      });

      it('subtract more than one day (1500 min = 25 hrs)', function () {
        expect((0, _clock2['default'])(5, 32).minus(1500).toString()).toEqual('04:32');
      });

      it('subtract more than two days', function () {
        expect((0, _clock2['default'])(2, 20).minus(3000).toString()).toEqual('00:20');
      });
    });

    describe('Construct two separate clocks, set times, test if they are equal', function () {

      it('clocks with same time', function () {
        expect((0, _clock2['default'])(15, 37).equals((0, _clock2['default'])(15, 37))).toBeTruthy();
      });

      it('clocks a minute apart', function () {
        expect((0, _clock2['default'])(15, 36).equals((0, _clock2['default'])(15, 37))).toBeFalsy();
      });

      it('clocks an hour apart', function () {
        expect((0, _clock2['default'])(14, 37).equals((0, _clock2['default'])(15, 37))).toBeFalsy();
      });

      it('clocks with hour overflow', function () {
        expect((0, _clock2['default'])(10, 37).equals((0, _clock2['default'])(34, 37))).toBeTruthy();
      });

      it('clocks with hour overflow by several days', function () {
        expect((0, _clock2['default'])(3, 11).equals((0, _clock2['default'])(99, 11))).toBeTruthy();
      });

      it('clocks with negative hour', function () {
        expect((0, _clock2['default'])(22, 40).equals((0, _clock2['default'])(-2, 40))).toBeTruthy();
      });

      it('clocks with negative hour that wraps', function () {
        expect((0, _clock2['default'])(17, 3).equals((0, _clock2['default'])(-31, 3))).toBeTruthy();
      });

      it('clocks with negative hour that wraps multiple times', function () {
        expect((0, _clock2['default'])(13, 49).equals((0, _clock2['default'])(-83, 49))).toBeTruthy();
      });

      it('clocks with minute overflow', function () {
        expect((0, _clock2['default'])(0, 1).equals((0, _clock2['default'])(0, 1441))).toBeTruthy();
      });

      it('clocks with minute overflow by several days', function () {
        expect((0, _clock2['default'])(2, 2).equals((0, _clock2['default'])(2, 4322))).toBeTruthy();
      });

      it('clocks with negative minute', function () {
        expect((0, _clock2['default'])(2, 40).equals((0, _clock2['default'])(3, -20))).toBeTruthy();
      });

      it('clocks with negative minute that wraps', function () {
        expect((0, _clock2['default'])(4, 10).equals((0, _clock2['default'])(5, -1490))).toBeTruthy();
      });

      it('clocks with negative minute that wraps multiple times', function () {
        expect((0, _clock2['default'])(6, 15).equals((0, _clock2['default'])(6, -4305))).toBeTruthy();
      });

      it('clocks with negative hours and minutes', function () {
        expect((0, _clock2['default'])(7, 32).equals((0, _clock2['default'])(-12, -268))).toBeTruthy();
      });

      it('clocks with negative hours and minutes that wrap', function () {
        expect((0, _clock2['default'])(18, 7).equals((0, _clock2['default'])(-54, -11513))).toBeTruthy();
      });
    });
  });
});