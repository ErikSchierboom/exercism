using System.Text.RegularExpressions;

public static class PigLatin
{
    private static readonly Regex VowelRegex = new Regex(@"(?<begin>^|\s+)(?<vowel>a|e|i|o|u|yt|xr)(?<rest>\w+)", RegexOptions.Compiled);
    private static readonly Regex ConsonantRegex = new Regex(@"(?<begin>^|\s+)(?<consonant>ch|qu|thr|th|sch|yt|\wqu|\w)(?<rest>\w+)", RegexOptions.Compiled);

    private const string VowelReplacement = "${begin}${vowel}${rest}ay";
    private const string ConsonantReplacement = "${begin}${rest}${consonant}ay";

    public static string Translate(string sentence)
    {
        if (VowelRegex.IsMatch(sentence))
        {
            return VowelRegex.Replace(sentence, VowelReplacement);
        }

        return ConsonantRegex.Replace(sentence, ConsonantReplacement);
    }
}