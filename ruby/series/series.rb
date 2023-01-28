class Series
  def initialize(numerals) = @numerals = numerals

  def slices(length)
    raise ArgumentError if length > @numerals.length

    @numerals.chars.each_cons(length).map(&:join)
  end
end