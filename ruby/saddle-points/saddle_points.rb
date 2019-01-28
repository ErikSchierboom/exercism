class Matrix
  attr_reader :rows, :columns

  def initialize(matrix)
    @rows = matrix.each_line.map { |line| line.split.map(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    rows_maximum = @rows.map(&:max)
    columns_minimum = @columns.map(&:min)

    coordinates.select { |row, column| rows_maximum[row] == columns_minimum[column] }
  end

  private

  def coordinates
    rows.each_index.to_a.product(columns.each_index.to_a)
  end
end