using System;

public enum Direction { North, East, South, West }

public class RobotSimulator
{
    public RobotSimulator(Direction direction, int x, int y) =>
        (Direction, X, Y) = (direction, x, y);

    public Direction Direction { get; private set; }
    public int X { get; private set; }
    public int Y { get; private set; }

    public void TurnRight() =>
        Direction = Direction switch
        {
            Direction.North => Direction.East,
            Direction.East  => Direction.South,
            Direction.South => Direction.West,
            Direction.West  => Direction.North,
            _ => throw new ArgumentOutOfRangeException()
        };

    public void TurnLeft() =>
        Direction = Direction switch
        {
            Direction.North => Direction.West,
            Direction.East  => Direction.North,
            Direction.South => Direction.East,
            Direction.West  => Direction.South,
            _ => throw new ArgumentOutOfRangeException()
        };

    public void Advance() =>
        (X, Y) = Direction switch
        {
            Direction.North => (X, Y + 1),
            Direction.East  => (X + 1, Y),
            Direction.South => (X, Y - 1),
            Direction.West  => (X - 1, Y),
            _ => throw new ArgumentOutOfRangeException()
        };

    public void Move(string instructions)
    {
        foreach (var instruction in instructions)
            ProcessInstruction(instruction);
    }

    private void ProcessInstruction(char code)
    {   
        switch (code)
        {
            case 'L':
                TurnLeft();
                break;
            case 'R':
                TurnRight();
                break;
            case 'A':
                Advance();
                break;
            default:
                throw new ArgumentOutOfRangeException(nameof(code), "Invalid instruction");
        }
    }
}