module PigLatin
  def self.translate(sentence)
    if sentence.match?(VOWEL_REGEX)
      sentence.gsub(VOWEL_REGEX, VOWEL_REPLACEMENT)
    else
      sentence.gsub(CONSONANT_REGEX, CONSONANT_REPLACEMENT)
    end
  end

  VOWEL_REGEX = /(?<begin>^|\s+)(?<vowel>a|e|i|o|u|yt|xr)(?<rest>\w+)/.freeze
  VOWEL_REPLACEMENT = '\k<begin>\k<vowel>\k<rest>ay'.freeze

  CONSONANT_REGEX = /(?<begin>^|\s+)(?<consonant>ch|qu|thr|th|rh|sch|yt|\wqu|\w)(?<rest>\w+)/.freeze
  CONSONANT_REPLACEMENT = '\k<begin>\k<rest>\k<consonant>ay'.freeze

  private_constant :VOWEL_REGEX, :CONSONANT_REGEX, :VOWEL_REPLACEMENT, :CONSONANT_REPLACEMENT
end