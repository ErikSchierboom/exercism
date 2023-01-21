module MatchingBrackets
  def self.valid?(str : String) : Bool
    unmatched = [] of Char

    str.each_char do |letter|
      return false if DELIMITERS.has_key?(letter) && unmatched.pop? != DELIMITERS[letter]

      unmatched << letter if DELIMITERS.has_value?(letter)
    end

    unmatched.empty?
  end

  DELIMITERS = {']' => '[', ')' => '(', '}' => '{'}
end
