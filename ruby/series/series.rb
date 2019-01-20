class Series

  attr_reader :numerals

  def initialize(numerals)
    @numerals = numerals
  end

  def slices(length)
    raise ArgumentError, 'Slice length must be less than or equal to input length' unless length <= numerals.length

    numerals[0..-length]
      .each_char
      .each_with_index
      .map { |_, index| numerals[index, length] }
  end
end