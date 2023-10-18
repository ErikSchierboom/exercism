require "spec"
require "../src/*"

describe Lasagna do
  describe "EXPECTED_MINUTES_IN_OVEN" do
    it "should be 40" do
      Lasagna::EXPECTED_MINUTES_IN_OVEN.should eq 40
    end
  end

  describe "remaining_minutes_in_oven" do
    it "Giving 15 should return 25" do
      Lasagna.new.remaining_minutes_in_oven(25).should eq(15)
    end
    it "Giving 1 should return 39" do
      Lasagna.new.remaining_minutes_in_oven(1).should eq(39)
    end
    it "Giving 39 should return 1" do
      Lasagna.new.remaining_minutes_in_oven(39).should eq(1)
    end
  end

  describe "preparation_time_in_minutes" do
    it "1 layer should return 2" do
      Lasagna.new.preparation_time_in_minutes(1).should eq(2)
    end
    it "2 layers should return 4" do
      Lasagna.new.preparation_time_in_minutes(2).should eq(4)
    end
    it "4 layers should return 8" do
      Lasagna.new.preparation_time_in_minutes(4).should eq(8)
    end
  end

  describe "total_time_in_minutes" do
    it "1 layer, 30 minutes in oven should return 32" do
      Lasagna.new.total_time_in_minutes(1, 30).should eq(32)
    end
    it "2 layers, 25 minutes in oven should return 29" do
      Lasagna.new.total_time_in_minutes(2, 25).should eq(29)
    end
    it "4 layers, 8 minutes in oven should return 16" do
      Lasagna.new.total_time_in_minutes(4, 8).should eq(16)
    end
  end
end
