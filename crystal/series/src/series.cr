module Series
  def self.slices(series : String, slice_length : Number) : Array(String)
    raise ArgumentError.new if slice_length > series.size

    series.chars.each_cons(slice_length).map(&.join).to_a
  end
end
