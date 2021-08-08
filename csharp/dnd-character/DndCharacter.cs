using System;
using System.Linq;

public record DndCharacter(int Strength, int Dexterity, int Constitution, int Intelligence, int Wisdom, int Charisma)
{
    public int Hitpoints { get; } = 10 + Modifier(Constitution);
    
    public static int Modifier(int score) => (int)Math.Floor((score - 10) / 2.0);

    public static int Ability() =>
        Enumerable.Range(0, 4)
            .Select(_ => Die.Roll())
            .OrderByDescending(score => score).Take(3).Sum();

    public static DndCharacter Generate() =>
        new(Ability(), Ability(), Ability(), Ability(), Ability(), Ability());
}

public static class Die
{
    private static readonly Random Random = new();

    public static int Roll() => Random.Next(1, 7);
}