using System.Linq;

public static class Isogram
{
    public static bool IsIsogram(string input)
    {
        var lowerInput = input.ToLower().Where(char.IsLetter).ToList();
        return lowerInput.Distinct().Count() == lowerInput.Count;
    }
}