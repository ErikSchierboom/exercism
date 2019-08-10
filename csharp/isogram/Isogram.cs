using System.Linq;

public static class Isogram
{
    public static bool IsIsogram(string word)
    {
        var lowerCaseLetters = word.ToLower().Where(char.IsLetter).ToList();
        return lowerCaseLetters.Distinct().Count() == lowerCaseLetters.Count;
    }
}
