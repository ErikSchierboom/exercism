class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    @scores.last
  end

  def personal_best
    @scores.max
  end

  def personal_top
    @scores.sort.reverse.take(3)
  end

  def report
    difference = personal_best - latest
    difference_report = "#{difference} short of " unless difference == 0
    "Your latest score was #{latest}. That's #{difference_report}your personal best!"
  end
end