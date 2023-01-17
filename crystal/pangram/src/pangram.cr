module Pangram
  def self.pangram?(sentence)
    ([*'a'..'z'] - sentence.downcase.chars).empty?
  end
end
