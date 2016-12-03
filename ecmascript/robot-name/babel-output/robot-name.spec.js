'use strict';

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

var _robotName = require('./robot-name');

var _robotName2 = _interopRequireDefault(_robotName);

describe('Robot', function () {
  var robot = undefined;

  beforeEach(function () {
    robot = new _robotName2['default']();
  });

  it('has a name', function () {
    expect(robot.name).toMatch(/^[A-Z]{2}\d{3}$/);
  });

  it('name is the same each time', function () {
    expect(robot.name).toEqual(robot.name);
  });

  it('different robots have different names', function () {
    var differentRobot = new _robotName2['default']();
    expect(differentRobot.name).not.toEqual(robot.name);
  });

  it('there can be lots of robots with different names each', function () {
    var NUMBER_OF_ROBOTS = 10000;
    var usedNames = new Set();

    for (var i = 0; i < NUMBER_OF_ROBOTS; i++) {
      var newRobot = new _robotName2['default']();
      usedNames.add(newRobot.name);
    }

    expect(usedNames.size).toEqual(NUMBER_OF_ROBOTS);
  });

  it('is able to reset the name', function () {
    var originalName = robot.name;

    robot.reset();
    var newName = robot.name;

    expect(newName).toMatch(/^[A-Z]{2}\d{3}$/);
    expect(originalName).not.toEqual(newName);
  });

  it('should set a unique name after reset', function () {
    var NUMBER_OF_ROBOTS = 10000;
    var usedNames = new Set();

    usedNames.add(robot.name);
    for (var i = 0; i < NUMBER_OF_ROBOTS; i++) {
      robot.reset();
      usedNames.add(robot.name);
    }

    expect(usedNames.size).toEqual(NUMBER_OF_ROBOTS + 1);
  });

  it('internal name cannot be modified', function () {
    var modifyInternal = function modifyInternal() {
      return robot.name += "a modification";
    };
    expect(modifyInternal).toThrow();
  });

  it('new names should not be sequential', function () {
    var name1 = robot.name;
    var name2 = new _robotName2['default']().name;
    var name3 = new _robotName2['default']().name;
    expect(areSequential(name1, name1)).toBe(true);
    expect(areSequential(name1, name2)).toBe(false);
    expect(areSequential(name2, name3)).toBe(false);
  });

  it('names from reset should not be sequential', function () {
    var name1 = robot.name;
    robot.reset();
    var name2 = robot.name;
    robot.reset();
    var name3 = robot.name;
    expect(areSequential(name1, name2)).toBe(false);
    expect(areSequential(name2, name3)).toBe(false);
    expect(areSequential(name3, name3)).toBe(true);
  });
});

var areSequential = function areSequential(name1, name2) {
  var alpha1 = name1.substr(0, 2);
  var alpha2 = name2.substr(0, 2);
  var num1 = +name1.substr(2, 3);
  var num2 = +name2.substr(2, 3);

  var numDiff = num2 - num1;
  var alphaDiff = (alpha2.charCodeAt(0) - alpha1.charCodeAt(0)) * 26 + (alpha2.charCodeAt(1) - alpha1.charCodeAt(1));

  var totalDiff = alphaDiff * 1000 + numDiff;

  return Math.abs(totalDiff) <= 1;
};