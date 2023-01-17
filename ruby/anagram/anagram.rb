class Anagram
  def initialize(input)
    @input = input
    @normalized_string = normalize(input)
  end

  def match(candidates) = candidates.select(&method(:anagram?))

  private
  attr_reader :input, :normalized_string

  def anagram?(candidate)
    normalize(candidate) == normalized_string unless candidate.casecmp?(input)
  end

  def normalize(string) = string.downcase.chars.sort
end