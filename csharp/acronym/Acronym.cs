using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public static class Acronym
{
    public static string Abbreviate(string phrase) =>
        new(phrase.Words().Select(FirstLetter).ToArray());

    private static IEnumerable<string> Words(this string phrase) =>
        Regex.Matches(phrase, @"[A-Za-z]+('[A-Za-z]+)?").Select(m => m.Value);

    private static char FirstLetter(string word) =>
        char.ToUpper(word[0]);
}