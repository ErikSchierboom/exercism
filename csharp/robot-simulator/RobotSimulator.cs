using System;

public enum Direction { North, East, South, West }

public record Coordinate(int X, int Y);

public class RobotSimulator
{
    public RobotSimulator(Direction direction, Coordinate coordinate) =>
        (Direction, Coordinate) = (direction, coordinate);

    public Direction Direction { get; private set; }
    public Coordinate Coordinate { get; private set; }

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
        Coordinate = Direction switch
        {
            Direction.North => Coordinate with { Y = Coordinate.Y + 1 },
            Direction.East  => Coordinate with { X = Coordinate.X + 1 },
            Direction.South => Coordinate with { Y = Coordinate.Y - 1 },
            Direction.West  => Coordinate with { X = Coordinate.X - 1 },
            _ => throw new ArgumentOutOfRangeException()
        };

    public void Simulate(string instructions)
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