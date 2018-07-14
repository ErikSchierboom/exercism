using System.Collections.Generic;

public class Allergies
{
    private static readonly IDictionary<int, string> AllergiesBitMasks = new Dictionary<int, string>
                                                                     {
                                                                         { 1 << 0, "eggs" },
                                                                         { 1 << 1, "peanuts" },
                                                                         { 1 << 2, "shellfish" },
                                                                         { 1 << 3, "strawberries" },
                                                                         { 1 << 4, "tomatoes" },
                                                                         { 1 << 5, "chocolate" },
                                                                         { 1 << 6, "pollen" },
                                                                         { 1 << 7, "cats" },
                                                                     };

    private readonly List<string> allergies = new List<string>();

    public Allergies(int codedAllergies)
    {
        foreach (var allergyBitMask in AllergiesBitMasks)
        {
            var hasAllergy = (codedAllergies & allergyBitMask.Key) != 0;

            if (hasAllergy)
            {
                this.allergies.Add(allergyBitMask.Value);
            }
        }
    }

    public bool AllergicTo(string allergy)
    {
        return this.allergies.Contains(allergy);
    }

    public List<string> List()
    {
        return this.allergies;
    }
}