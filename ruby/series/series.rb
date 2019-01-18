class Series
  def initialize(series)
    @series = series
  end

  def slices(length)
    raise ArgumentError, 'Invalid slice length' if length > @series.length

    (0..@series.length - length).map { |index| @series[index, length] }
  end
end