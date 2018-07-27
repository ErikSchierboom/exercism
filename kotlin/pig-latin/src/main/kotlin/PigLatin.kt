object PigLatin {
    val vowelRegex = Regex("(?<begin>^|\\s+)(?<vowel>a|e|i|o|u|yt|xr)(?<rest>\\w+)")
    val consonantRegex = Regex("(?<begin>^|\\s+)(?<consonant>ch|qu|thr|th|sch|yt|\\wqu|\\w)(?<rest>\\w+)")

    val vowelReplacement = "\${begin}\${vowel}\${rest}ay"
    val consonantReplacement = "\${begin}\${rest}\${consonant}ay"

    fun translate(input: String): String =
        if (vowelRegex.matches(input)) vowelRegex.replace(input, vowelReplacement)
        else consonantRegex.replace(input, consonantReplacement)
}