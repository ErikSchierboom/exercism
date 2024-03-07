using System;
using System.Linq;

[Flags]
public enum Allergen
{
    Eggs         = 0b00000001,
    Peanuts      = 0b00000010,
    Shellfish    = 0b00000100,
    Strawberries = 0b00001000,
    Tomatoes     = 0b00010000,
    Chocolate    = 0b00100000,
    Pollen       = 0b01000000,
    Cats         = 0b10000000
}

public record Allergies(int code)
{
    public bool IsAllergicTo(Allergen allergen) =>
        ((Allergen)code).HasFlag(allergen);
    
    public Allergen[] List() =>
        Enum.GetValues<Allergen>()
            .Where(IsAllergicTo)
            .ToArray();
}