class Diamond
  def self.make_diamond(letter)
    new(letter).make
  end

  def initialize(letter)
    @letters = ('A'..letter).to_a
  end

  def make
    line_letters
      .map { |(letter, index)| make_line(letter, index) }
      .join('')
  end

  private

  attr_reader :letters

  def line_letters
    top_and_middle_letters = letters.each_with_index.to_a
    bottom_letters = top_and_middle_letters.reverse_each.drop(1)

    top_and_middle_letters + bottom_letters
  end

  def make_line(letter, index)
    outer_spaces = ''.ljust(letters.size - index - 1)
    inner_spaces = ''.ljust(index * 2 - 1)

    return "#{outer_spaces}#{letter}#{outer_spaces}\n" if letter == 'A'

    "#{outer_spaces}#{letter}#{inner_spaces}#{letter}#{outer_spaces}\n"
  end
end