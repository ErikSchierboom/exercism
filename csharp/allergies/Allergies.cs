using System;
using System.Collections.Generic;
using System.Linq;

public enum Allergen { Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats }

public class Allergies
{
    private readonly List<Allergen> _allergies;

    public Allergies(int codedAllergies) =>
        _allergies = Enum.GetValues<Allergen>()
            .Where((_, shiftLeft) => (codedAllergies & 1 << shiftLeft) != 0)
            .ToList();

    public bool IsAllergicTo(Allergen allergen) => _allergies.Contains(allergen);

    public List<Allergen> List() => _allergies; 
}