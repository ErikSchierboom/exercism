module Brackets
  BRACKET_PAIRS = { ']' => '[', ')' => '(', '}' => '{' }.freeze
  private_constant :BRACKET_PAIRS

  def self.paired?(input)
    open_brackets = []

    input.each_char do |c|
      if BRACKET_PAIRS.key?(c)
        return false if open_brackets.pop != BRACKET_PAIRS[c]
      elsif BRACKET_PAIRS.value?(c)
        open_brackets << c
      end
    end

    open_brackets.empty?
  end
end