class Triangle
  attr_reader :rows

  def initialize(row_count)
    @rows = 1.upto(row_count).map(&method(:row)).to_a
  end

  private

  def row(index)
    1.upto(index - 1).each_with_object([1]) do |j, elements|
      elements << elements.last * (index - j) / j
    end
  end
end