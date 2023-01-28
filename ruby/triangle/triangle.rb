class Triangle
  def initialize(sides) = @sides = sides

  def equilateral? = @sides.uniq.size == 1 && valid?
  def isosceles? = @sides.uniq.size < 3 && valid?
  def scalene? = @sides.uniq.size == 3 && valid?

  private
  def valid? = !all_zero_sides? && !violates_triangle_equality?  
  def all_zero_sides? = @sides.all?(&:zero?)
  def violates_triangle_equality? = @sides.sort.then { |(x, y, z)| x + y < z }
end
