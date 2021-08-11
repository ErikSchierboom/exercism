class Darts
  def initialize(x, y)
    @x = x
    @y = y
  end

  def score
    case distance_from_center
    when 0..1
      10
    when 1..5
      5
    when 5..10
      1
    else
      0
    end
  end

  private
  attr_reader :x, :y

  def distance_from_center
    Math.hypot(x, y)
  end
end
