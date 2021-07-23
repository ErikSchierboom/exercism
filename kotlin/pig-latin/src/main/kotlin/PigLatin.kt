object PigLatin {
    fun translate(input: String) =
        if (vowelRegex.matches(input)) vowelRegex.replace(input, vowelReplacement)
        else consonantRegex.replace(input, consonantReplacement)

    private val vowelRegex = Regex("""(?<begin>^|\s+)(?<vowel>a|e|i|o|u|yt|xr)(?<rest>\w+)""")
    private val consonantRegex = Regex("""(?<begin>^|\s+)(?<consonant>ch|qu|thr|th|sch|yt|\wqu|\w)(?<rest>\w+)""")

    private const val vowelReplacement = "\${begin}\${vowel}\${rest}ay"
    private const val consonantReplacement = "\${begin}\${rest}\${consonant}ay"
}