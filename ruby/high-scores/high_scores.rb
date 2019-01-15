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
    difference = self.personal_best - self.latest

    latest_report = "Your latest score was #{self.latest}."
    latest_comparison_report = difference == 0 ? "That's your personal best!" : "That's #{difference} short of your personal best!"

    "#{latest_report} #{latest_comparison_report}"
  end
end