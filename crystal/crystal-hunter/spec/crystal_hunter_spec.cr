require "spec"
require "../src/*"

describe Rules do
  describe "bonus_points?" do
    it "Character gets bonus points" do
      Rules.new.bonus_points?(true, true).should be_true
    end

    it "Character gets no bonus points because no power-up is active" do
      Rules.new.bonus_points?(false, true).should be_false
    end

    it "Character gets no bonus points because not touching bandit" do
      Rules.new.bonus_points?(true, false).should be_false
    end

    it "Character gets no bonus points because no power-up is active and character is not touching bandit" do
      Rules.new.bonus_points?(false, false).should be_false
    end
  end

  describe "score?" do
    it "Score when picking up crystal" do
      Rules.new.score?(true, false).should be_true
    end

    it "Score when picking up power-up" do
      Rules.new.score?(false, true).should be_true
    end

    it "No score when not picking up anything" do
      Rules.new.score?(false, false).should be_false
    end
  end

  describe "lose?" do
    it "Lose if touching a bandit without a power-up active" do
      Rules.new.lose?(false, true).should be_true
    end

    it "Don't lose if touching a bandit with a power-up active" do
      Rules.new.lose?(true, true).should be_false
    end

    it "Don't lose if not touching a bandit" do
      Rules.new.lose?(false, false).should be_false
    end

    it "Don't lose if powered-up and not touching a bandit" do
      Rules.new.lose?(true, false).should be_false
    end
  end

  describe "win?" do
    it "Win if all crystals have been picked up" do
      Rules.new.win?(true, false, false).should be_true
    end

    it "Don't win if all crystals have been picked up, but touching a bandit" do
      Rules.new.win?(true, false, true).should be_false
    end

    it "Win if all crystals have been picked up and touching a bandit with a power-up active" do
      Rules.new.win?(true, true, true).should be_true
    end
  end
end
