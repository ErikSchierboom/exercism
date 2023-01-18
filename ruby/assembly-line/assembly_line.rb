class AssemblyLine
  CARS_PER_HOUR = 221

  def initialize(speed) = @speed = speed
  def production_rate_per_hour = CARS_PER_HOUR * @speed * success_ratio
  def working_items_per_minute = (production_rate_per_hour / 60.0).floor

  def success_ratio
    case @speed
    when 1..4 then 1.0
    when 5..8 then 0.9
    when 9 then 0.8
    when 10 then 0.77
    else 0.0
    end
  end
end
