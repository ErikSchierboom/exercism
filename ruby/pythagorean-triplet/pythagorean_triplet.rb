class Triplet
  def initialize(x, y, z)
    @x, @y, @z = x, y, z
  end

  def sum = @x + @y + @z
  def product = @x * @y * @z
  def pythagorean? = @x**2 + @y**2 == @z**2

  def self.where(max_factor: 1, min_factor: 1, sum: nil)
    (min_factor...max_factor).flat_map do |x|
      (x.succ...max_factor).flat_map do |y|
        (y.succ..max_factor).filter_map do |z|
          triplet = new(x, y, z)
          triplet if triplet.pythagorean? && (sum.nil? || sum == triplet.sum)
        end
      end
    end
  end
end