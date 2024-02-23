using System;
using System.Linq;

[Flags]
public enum Allergen
{
    Eggs         = 1,
    Peanuts      = 2,
    Shellfish    = 4,
    Strawberries = 8,
    Tomatoes     = 16,
    Chocolate    = 32,
    Pollen       = 64,
    Cats         = 128
}

public class Allergies(int code)
{
    public bool IsAllergicTo(Allergen allergen) => ((Allergen)code).HasFlag(allergen);
    public Allergen[] List() => Enum.GetValues<Allergen>().Where(IsAllergicTo).ToArray();
}