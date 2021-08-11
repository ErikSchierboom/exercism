class Series
  def initialize(numerals)
    @numerals = numerals
  end

  def slices(length)
    raise ArgumentError unless length <= numerals.length

    numerals.chars.each_cons(length).map(&:join)
  end

  private
  attr_reader :numerals
end