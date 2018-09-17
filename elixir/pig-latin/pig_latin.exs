defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    vowelRegex = ~r/(^|\s+)([aeiou]|yt|yd|xr|xb)(\w+)/
    consonantRegex = ~r/(^|\s+)([^aeiou]*qu|[^aeiou]+)(\w+)/

    vowelReplacement = "\\g{1}\\g{2}\\g{3}ay"
    consonantReplacement = "\\g{1}\\g{3}\\g{2}ay"

    if Regex.match?(vowelRegex, phrase) do
      Regex.replace(vowelRegex, phrase, vowelReplacement)
    else
      Regex.replace(consonantRegex, phrase, consonantReplacement)
    end
  end
end
