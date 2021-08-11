module Brackets
  def self.paired?(input)
    open_delimiters = []

    input.each_char do |c|
      return false if DELIMITER_PAIRS.key?(c) && open_delimiters.pop != DELIMITER_PAIRS[c]

      open_delimiters << c if DELIMITER_PAIRS.value?(c)
    end

    open_delimiters.empty?
  end

  private
  DELIMITER_PAIRS = { ']' => '[', ')' => '(', '}' => '{' }.freeze
  private_constant :DELIMITER_PAIRS
end