require "spec"
require "../src/*"

describe "HighScores" do
  it "List of scores" do
    high_scores = HighScores.new([30, 50, 20, 70])
    high_scores.scores.should eq([30, 50, 20, 70])
  end

  it "Latest score" do
    high_scores = HighScores.new([100, 0, 90, 30])
    high_scores.latest.should eq(30)
  end

  it "Personal best" do
    high_scores = HighScores.new([40, 100, 70])
    high_scores.personal_best.should eq(100)
  end

  it "Personal top three from a list of scores" do
    high_scores = HighScores.new([10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70])
    high_scores.personal_top_three.should eq([100, 90, 70])
  end

  it "Personal top highest to lowest" do
    high_scores = HighScores.new([20, 10, 30])
    high_scores.personal_top_three.should eq([30, 20, 10])
  end

  it "Personal top when there is a tie" do
    high_scores = HighScores.new([40, 20, 40, 30])
    high_scores.personal_top_three.should eq([40, 40, 30])
  end

  it "Personal top when there are less than 3" do
    high_scores = HighScores.new([30, 70])
    high_scores.personal_top_three.should eq([70, 30])
  end

  it "Personal top when there is only one" do
    high_scores = HighScores.new([40])
    high_scores.personal_top_three.should eq([40])
  end

  it "Latest score after personal top scores" do
    high_scores = HighScores.new([70, 50, 20, 30])
    expected = 30
    high_scores.personal_top_three
    high_scores.latest.should eq expected
  end

  it "Scores after personal top scores" do
    high_scores = HighScores.new([30, 50, 20, 70])
    expected = [30, 50, 20, 70]
    high_scores.personal_top_three
    high_scores.scores.should eq expected
  end

  it "Latest score after personal best" do
    high_scores = HighScores.new([20, 70, 15, 25, 30])
    expected = 30
    high_scores.personal_best
    high_scores.latest.should eq expected
  end

  it "Scores after personal best" do
    high_scores = HighScores.new([20, 70, 15, 25, 30])
    expected = [20, 70, 15, 25, 30]
    high_scores.personal_best
    high_scores.scores.should eq expected
  end
end
