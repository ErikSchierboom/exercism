using System;

public enum Direction { North, East, South, West }

public record RobotSimulator(Direction Direction, int X, int Y)
{
    public Direction Direction { get; private set; } = Direction;
    public int X { get; private set; } = X;
    public int Y { get; private set; } = Y;

    public void Move(string instructions)
    {
        foreach (var instruction in instructions)
            ProcessInstruction(instruction);
    }

    private void ProcessInstruction(char code)
    {
        if (code == 'L')
            TurnLeft();
        else if (code == 'R')
            TurnRight();
        else if (code == 'A')
            Advance();
    }

    private void TurnRight() =>
        Direction = Direction switch
        {
            Direction.North => Direction.East,
            Direction.East  => Direction.South,
            Direction.South => Direction.West,
            Direction.West  => Direction.North,
            _ => throw new ArgumentOutOfRangeException()
        };

    private void TurnLeft() =>
        Direction = Direction switch
        {
            Direction.North => Direction.West,
            Direction.East  => Direction.North,
            Direction.South => Direction.East,
            Direction.West  => Direction.South,
            _ => throw new ArgumentOutOfRangeException()
        };

    private void Advance() =>
        (X, Y) = Direction switch
        {
            Direction.North => (X, Y + 1),
            Direction.East  => (X + 1, Y),
            Direction.South => (X, Y - 1),
            Direction.West  => (X - 1, Y),
            _ => throw new ArgumentOutOfRangeException()
        };
}