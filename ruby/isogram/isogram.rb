require 'set'

module Isogram
  def self.isogram?(word)
    found_letters = Set.new([])

    word.scan(/\w/).each do |letter|
      return false if found_letters.include?(letter.downcase)

      found_letters.add(letter.downcase)
    end
  end
end