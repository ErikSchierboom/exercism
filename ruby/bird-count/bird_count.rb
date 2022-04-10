class BirdCount
  def self.last_week = [0, 2, 5, 3, 7, 8, 4]

  def initialize(birds_per_day) = @birds_per_day = birds_per_day

  def yesterday = @birds_per_day[-2]
  def total = @birds_per_day.sum
  def busy_days = @birds_per_day.count { |count| count >= 5 }
  def day_without_birds? = @birds_per_day.include?(0)
end
