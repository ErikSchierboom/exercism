public class PigLatin {

    private static final String VOWEL_REGEX = "(?<begin>^|\\s+)(?<vowel>a|e|i|o|u|yt|xr)(?<rest>\\w+)";
    private static final String CONSONANT_REGEX = "(?<begin>^|\\s+)(?<consonant>ch|qu|thr|th|sch|yt|\\wqu|\\w)(?<rest>\\w+)";

    private static final String VOWEL_REPLACEMENT = "${begin}${vowel}${rest}ay";
    private static final String CONSONANT_REPLACEMENT = "${begin}${rest}${consonant}ay";

    public static String translate(String input) {
        if (input.matches(VOWEL_REGEX)) {
            return input.replaceAll(VOWEL_REGEX, VOWEL_REPLACEMENT);
        }

        return input.replaceAll(CONSONANT_REGEX, CONSONANT_REPLACEMENT);
    }
}
