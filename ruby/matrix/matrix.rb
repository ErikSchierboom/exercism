class Matrix
  attr_reader :rows, :columns

  def initialize(input)
    @rows = input.each_line.map { |line| line.split.map(&:to_i) }
    @columns = rows.transpose
  end
end
