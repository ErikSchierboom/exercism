module Pangram
  def self.pangram?(sentence)
    lower_sentence = sentence.downcase
    ('a'..'z').all? { |letter| lower_sentence.include?(letter) }
  end
end