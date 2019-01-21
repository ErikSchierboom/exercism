class Series

  attr_reader :numerals

  def initialize(numerals)
    @numerals = numerals
  end

  def slices(length)
    raise ArgumentError, 'Slice length must be less than or equal to input length' unless length <= numerals.length

    numerals.each_char.each_cons(length).map(&:join)
  end
end