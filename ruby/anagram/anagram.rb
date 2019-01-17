class Anagram
  def initialize(string)
    @downcased_string = string.downcase
    @normalized_string = normalize(string)
  end

  def match(candidates)
    candidates.select(&method(:anagram?))
  end

  private

  def anagram?(candidate)
    normalize(candidate) == @normalized_string unless candidate.downcase == @downcased_string
  end

  def normalize(string)
    string.downcase.chars.sort
  end
end