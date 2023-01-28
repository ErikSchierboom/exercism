class Darts
  def initialize(x, y)
    @x = x
    @y = y
  end

  def score
    case distance_from_center
    when 0..1  then 10
    when 1..5  then 5
    when 5..10 then 1
    else            0
    end
  end

  private
  def distance_from_center = Math.hypot(@x, @y)
end
