class Scrabble
  LETTER_SCORES = [
    [%w(A E I O U L N R S T), 1],
    [%w(D G), 2],
    [%w(B C M P), 3],
    [%w(F H V W Y), 4],
    [%w(K), 5],
    [%w(J X), 8],
    [%w(Q Z), 10]
  ].flat_map do |(letters, score)|
    letters.map { |letter| [letter, score] }
  end.to_h

  private_constant :LETTER_SCORES

  def self.score(*args)
    new(*args).score
  end

  def initialize(word)
    @letters = word.to_s.strip.upcase.chars
  end

  def score
    letters.map { |letter| LETTER_SCORES[letter] }.sum
  end

  private

  attr_reader :letters
end

