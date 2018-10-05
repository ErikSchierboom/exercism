import Robot from './robot-simulator';
import { InvalidInputError } from './robot-simulator';

describe('Robot', () => {
  const robot = new Robot();

  test('robot bearing', () => {
    const directions = ['east', 'west', 'north', 'south'];

    directions.forEach((currentDirection) => {
      robot.orient(currentDirection);
      expect(robot.bearing).toEqual(currentDirection);
    });
  });

  test('invalid robot bearing', () => {
    expect(InvalidInputError.prototype).toBeInstanceOf(Error);
    expect(() => robot.orient('crood')).toThrow(InvalidInputError);
  });

  test('turn right from north', () => {
    robot.orient('north');
    robot.turnRight();
    expect(robot.bearing).toEqual('east');
  });

  test('turn right from east', () => {
    robot.orient('east');
    robot.turnRight();
    expect(robot.bearing).toEqual('south');
  });

  test('turn right from south', () => {
    robot.orient('south');
    robot.turnRight();
    expect(robot.bearing).toEqual('west');
  });

  test('turn right from west', () => {
    robot.orient('west');
    robot.turnRight();
    expect(robot.bearing).toEqual('north');
  });

  test('turn left from north', () => {
    robot.orient('north');
    robot.turnLeft();
    expect(robot.bearing).toEqual('west');
  });

  test('turn left from east', () => {
    robot.orient('east');
    robot.turnLeft();
    expect(robot.bearing).toEqual('north');
  });

  test('turn left from south', () => {
    robot.orient('south');
    robot.turnLeft();
    expect(robot.bearing).toEqual('east');
  });

  test('turn left from west', () => {
    robot.orient('west');
    robot.turnLeft();
    expect(robot.bearing).toEqual('south');
  });

  test('robot coordinates', () => {
    robot.at(3, 0);
    expect(robot.coordinates).toEqual([3, 0]);
  });

  test('other robot coordinates', () => {
    robot.at(-2, 5);
    expect(robot.coordinates).toEqual([-2, 5]);
  });

  test('advance when facing north', () => {
    robot.at(0, 0);
    robot.orient('north');
    robot.advance();
    expect(robot.coordinates).toEqual([0, 1]);
  });

  test('advance when facing east', () => {
    robot.at(0, 0);
    robot.orient('east');
    robot.advance();
    expect(robot.coordinates).toEqual([1, 0]);
  });

  test('advance when facing south', () => {
    robot.at(0, 0);
    robot.orient('south');
    robot.advance();
    expect(robot.coordinates).toEqual([0, -1]);
  });

  test('advance when facing west', () => {
    robot.at(0, 0);
    robot.orient('west');
    robot.advance();
    expect(robot.coordinates).toEqual([-1, 0]);
  });

  test('instructions for turning left', () => {
    expect(robot.instructions('L')).toEqual(['turnLeft']);
  });

  test('instructions for turning right', () => {
    expect(robot.instructions('R')).toEqual(['turnRight']);
  });

  test('instructions for advancing', () => {
    expect(robot.instructions('A')).toEqual(['advance']);
  });

  test('series of instructions', () => {
    expect(robot.instructions('RAAL'))
      .toEqual(['turnRight', 'advance', 'advance', 'turnLeft']);
  });

  test('instruct robot', () => {
    robot.place({ x: -2, y: 1, direction: 'east' });
    robot.evaluate('RLAALAL');
    expect(robot.coordinates).toEqual([0, 2]);
    expect(robot.bearing).toEqual('west');
  });

  test('instruct many robots', () => {
    const robot1 = new Robot();
    const robot2 = new Robot();
    const robot3 = new Robot();
    robot1.place({ x: 0, y: 0, direction: 'north' });
    robot2.place({ x: 2, y: -7, direction: 'east' });
    robot3.place({ x: 8, y: 4, direction: 'south' });
    robot1.evaluate('LAAARALA');
    robot2.evaluate('RRAAAAALA');
    robot3.evaluate('LAAARRRALLLL');

    expect(robot1.coordinates).toEqual([-4, 1]);
    expect(robot1.bearing).toEqual('west');

    expect(robot2.coordinates).toEqual([-3, -8]);
    expect(robot2.bearing).toEqual('south');

    expect(robot3.coordinates).toEqual([11, 5]);
    expect(robot3.bearing).toEqual('north');
  });
});
