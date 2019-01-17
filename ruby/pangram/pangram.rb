module Pangram
  def self.pangram?(sentence)
    lower_sentence = sentence.downcase
    ('a'..'z').to_a.all? { |letter| lower_sentence.include?(letter) }
  end
end