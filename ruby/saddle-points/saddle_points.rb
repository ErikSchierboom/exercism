class Matrix
  attr_reader :rows, :columns

  def initialize(matrix)
    @rows = matrix.each_line.map { |line| line.split.map(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    rows_maximum = @rows.map(&:max)
    columns_minimum = @columns.map(&:min)

    rows.each_index.each_with_object([]) do |row, points|
      columns.each_index do |column|
        points << [row, column] if rows_maximum[row] == columns_minimum[column]
      end
    end
  end
end