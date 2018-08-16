using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public static class Acronym
{
    public static string Abbreviate(string phrase) => new string(Words(phrase).Select(AcronymLetter).ToArray());

    private static IEnumerable<string> Words(string phrase) => Regex.Split(phrase, @"[^\w]+");

    private static char AcronymLetter(string word) => char.ToUpper(word[0]);
}