class Triangle
  @sides : Array(Float64)

  def initialize(sides)
    @sides = sides.map(&.to_f).to_a

    raise ArgumentError.new if invalid?
  end

  def equilateral?
    num_unique_sides == 1
  end

  def isosceles?
    num_unique_sides < 3
  end

  def scalene?
    num_unique_sides == 3
  end

  def invalid?
    violates_triangle_equality? || sides_all_zero?
  end

  def violates_triangle_equality?
    x, y, z = @sides.sort
    x + y < z
  end

  def sides_all_zero?
    @sides.all? &.zero?
  end

  def num_unique_sides
    @sides.uniq.size
  end
end
