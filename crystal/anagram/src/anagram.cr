module Anagram
  def self.find(word, candidates)
    candidates.select { |candidate| anagram?(candidate, word) }
  end

  def self.anagram?(candidate, word)
    normalize(candidate) == normalize(word) unless candidate.compare(word, case_insensitive: true).zero?
  end

  def self.normalize(string)
    string.downcase.chars.sort
  end
end
