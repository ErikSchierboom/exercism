class Matrix
  @rows : Array(Array(Int32))
  @columns : Array(Array(Int32))

  def initialize(input)
    @rows = input.each_line.map { |line| line.split.map { |x| x.to_i } }.to_a
    @columns = @rows.transpose
  end

  def row(y)
    @rows[y - 1]
  end

  def column(x)
    @columns[x - 1]
  end
end
