class HighScores
  attr_reader :scores

  def initialize(scores) = @scores = scores

  def latest = scores.last
  def personal_best = scores.max
  def personal_top = scores.sort.reverse.take(3)

  def report
    difference = personal_best - latest
    difference_report = "#{difference} short of " unless difference == 0
    "Your latest score was #{latest}. That's #{difference_report}your personal best!"
  end
end