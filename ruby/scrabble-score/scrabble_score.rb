class Scrabble
  LETTER_SCORES = [
    [%w(A E I O U L N R S T), 1],
    [%w(D G), 2],
    [%w(B C M P), 3],
    [%w(F H V W Y), 4],
    [%w(K), 5],
    [%w(J X), 8],
    [%w(Q Z), 10]
  ].flat_map { |(letters, score)| letters.map { |letter| [letter, score] } }.to_h

  def self.score(*args)
    new(*args).score
  end

  def initialize(word)
    @word = word
  end

  def score
    letters.map(&method(:score_letter)).sum
  end

  private

  def letters
    @word.to_s.strip.upcase.chars
  end

  def score_letter(letter)
    LETTER_SCORES[letter]
  end
end

