using System.Collections.Generic;
using System.Linq;

public class Allergies
{
    private static readonly IReadOnlyDictionary<int, string> AllergensByBitMask = new Dictionary<int, string>
    {
        [1 << 0] = "eggs",
        [1 << 1] = "peanuts",
        [1 << 2] = "shellfish",
        [1 << 3] = "strawberries",
        [1 << 4] = "tomatoes",
        [1 << 5] = "chocolate",
        [1 << 6] = "pollen",
        [1 << 7] = "cats",
    };

    private readonly List<string> _allergies;

    public Allergies(int codedAllergies)
        => _allergies = AllergensByBitMask
            .Where(allergenWithBitMask => (codedAllergies & allergenWithBitMask.Key) != 0)
            .Select(allergenWithBitMask => allergenWithBitMask.Value)
            .ToList();

    public bool IsAllergicTo(string allergy) => _allergies.Contains(allergy);

    public List<string> List() => _allergies;
}