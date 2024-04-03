using System.Linq;
using System.Text.RegularExpressions;

public static class Acronym
{
    public static string Abbreviate(string phrase) =>
        Regex.Matches(phrase.ToUpper(), @"[A-Z][A-Z']*")
            .Select(m => m.Value[0])
            .Aggregate("", (s, c) => s + c);
}