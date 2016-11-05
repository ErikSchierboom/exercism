object PigLatin {
  val vowelRegex = """(?<begin>^|\s+)(?<vowel>a|e|i|o|u|yt|xr)(?<rest>\w+)""".r
  val consonantRegex = """(?<begin>^|\s+)(?<consonant>ch|qu|thr|th|sch|yt|\wqu|\w)(?<rest>\w+)""".r

  val vowelReplacement = "${begin}${vowel}${rest}ay"
  val consonantReplacement = "${begin}${rest}${consonant}ay"

  def translate(sentence: String) =
    if (vowelRegex.findFirstIn(sentence).nonEmpty)
      vowelRegex.replaceAllIn(sentence, vowelReplacement)
  else
      consonantRegex.replaceAllIn(sentence, consonantReplacement)
}
