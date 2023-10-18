using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

public static partial class Acronym
{
    public static string Abbreviate(string phrase) =>
        new(phrase.Words().Select(FirstLetter).ToArray());

    private static IEnumerable<string> Words(this string phrase) =>
        WordsRegex().Matches(phrase).Select(m => m.Value);

    private static char FirstLetter(string word) =>
        char.ToUpper(word[0]);

    [GeneratedRegex("[A-Za-z]+('[A-Za-z]+)?")]
    private static partial Regex WordsRegex();
}