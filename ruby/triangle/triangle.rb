class Triangle
  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    @sides.uniq.size == 1 unless invalid?
  end

  def isosceles?
    @sides.uniq.size < 3 unless invalid?
  end

  def scalene?
    @sides.uniq.size == 3 unless invalid?
  end

  private

  def invalid?
    violates_triangle_equality? || sides_all_zero?
  end

  def violates_triangle_equality?
    (x, y, z) = @sides.sort
    x + y < z
  end

  def sides_all_zero?
    @sides.all?(&:zero?)
  end
end