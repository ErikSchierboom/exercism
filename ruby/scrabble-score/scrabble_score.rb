class Scrabble
  def self.score(*args) = new(*args).score

  def initialize(word) = @letters = word.to_s.strip.upcase.chars
  def score = @letters.sum { |letter| letter_score(letter) }

  private
  def letter_score(letter)
    case letter
    when *'AEIOULNRST'.chars then 1
    when *'DG'.chars         then 2
    when *'BCMP'.chars       then 3
    when *'FHVWY'.chars      then 4
    when *'K'.chars          then 5
    when *'JX'.chars         then 8
    when *'QZ'.chars         then 10
    end
  end
end

