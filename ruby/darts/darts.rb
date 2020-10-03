class Darts
  def initialize(x, y)
    @distance_from_center = Math.hypot(x, y)
  end

  def score
    return 10 if landed_in_inner_circle?
    return 5 if landed_in_middle_circle?
    return 1 if landed_in_outer_circle?

    0
  end

  private

  attr_reader :distance_from_center

  def landed_in_inner_circle?
    distance_from_center <= 1
  end

  def landed_in_middle_circle?
    distance_from_center > 1 && distance_from_center <= 5
  end

  def landed_in_outer_circle?
    distance_from_center > 5 && distance_from_center <= 10
  end
end
