using System.Text.RegularExpressions;

public static class PigLatin
{
    private const string VowelPattern = @"(?<begin>^|\s+)(?<vowel>[aeiou]|xr|yt)(?<rest>\w+)";
    private const string ConsonantPattern = @"(?<begin>^|\s+)(?<consonant>([^aeiou]?qu|[^aeiou]+))(?<rest>[aeiouy]\w*)";
    
    private const string VowelReplacement = "${begin}${vowel}${rest}ay";
    private const string ConsonantReplacement = "${begin}${rest}${consonant}ay";

    public static string Translate(string sentence) =>
        Regex.IsMatch(sentence, VowelPattern)
            ? Regex.Replace(sentence, VowelPattern, VowelReplacement)
            : Regex.Replace(sentence, ConsonantPattern, ConsonantReplacement);
}