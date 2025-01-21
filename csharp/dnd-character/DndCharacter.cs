using System;
using System.Linq;

public record DndCharacter(int Strength, int Dexterity, int Constitution, int Intelligence, int Wisdom, int Charisma)
{
    public int Hitpoints { get; } = 10 + Modifier(Constitution);
    
    public static int Modifier(int score) => -5 + score / 2;

    public static int Ability() =>
        Enumerable.Range(0, 4)
            .Select(_ => Random.Shared.Next(1, 7))
            .OrderDescending()
            .Take(3)
            .Sum();

    public static DndCharacter Generate() =>
        new(Ability(), Ability(), Ability(), Ability(), Ability(), Ability());
}
