using System.Linq;
using System.Text.RegularExpressions;

public static class RunLengthEncoding
{
    public static string Encode(string input) => 
        string.Join("", Regex.Matches(input, @"(.)\1*").Select(Encode));

    private static string Encode(Match match) =>
        match.Length == 1 ? match.Value : $"{match.Length}{match.Value[0]}";

    public static string Decode(string input) => 
        string.Join("", Regex.Matches(input, @"(\d+)?(.)").Select(Decode));

    private static string Decode(Match match) =>
        match.Length == 1 ? match.Value : new string(match.Groups[2].Value[0], int.Parse(match.Groups[1].Value));
}