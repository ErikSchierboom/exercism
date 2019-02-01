class Scrabble
  LETTER_SCORES = [
    ['AEIOULNRST', 1],
    ['DG', 2],
    ['BCMP', 3],
    ['FHVWY', 4],
    ['K', 5],
    ['JX', 8],
    ['QZ', 10]
  ].flat_map { |(word, score)| word.each_char.map { |letter| [letter, score] } }.to_h

  def initialize(word)
    @word = word
  end

  def score
    Scrabble.score(@word)
  end

  def self.score(word)
    letters(word).map(&method(:score_letter)).sum
  end

  private

  def self.letters(word)
    word.to_s.strip.upcase.chars
  end

  def self.score_letter(letter)
    LETTER_SCORES[letter]
  end
end

