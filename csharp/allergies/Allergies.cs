using System;
using System.Collections.Generic;
using System.Linq;

public enum Allergen { Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats }

public class Allergies
{
    private readonly List<string> _allergies;

    public Allergies(int codedAllergies) =>
        _allergies = Enum.GetValues<Allergen>()
            .Where((_, shiftLeft) => (codedAllergies & 1 << shiftLeft) != 0)
            .Select(allergen => allergen.ToString().ToLower())
            .ToList();

    public bool IsAllergicTo(string allergy) => _allergies.Contains(allergy);

    public List<string> List() => _allergies;
}