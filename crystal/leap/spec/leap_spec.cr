require "spec"
require "../src/*"

struct Time
  def leap_year?
    raise "That's too easy! Implement this method in your own way!"
  end
end

describe "Leap" do
  it "year not divisible by 4 in common year" do
    Year.leap?(2015).should be_false
  end

  it "year divisible by 2, not divisible by 4 in common year" do
    Year.leap?(1970).should be_false
  end

  it "year divisible by 4, not divisible by 100 in leap year" do
    Year.leap?(1996).should be_true
  end

  it "year divisible by 4 and 5 is still a leap year" do
    Year.leap?(1960).should be_true
  end

  it "year divisible by 100, not divisible by 400 in common year" do
    Year.leap?(2100).should be_false
  end

  it "year divisible by 100 but not by 3 is still not a leap year" do
    Year.leap?(1900).should be_false
  end

  it "year divisible by 400 is leap year" do
    Year.leap?(2000).should be_true
  end

  it "year divisible by 400 but not by 125 is still a leap year" do
    Year.leap?(2400).should be_true
  end

  it "year divisible by 200, not divisible by 400 in common year" do
    Year.leap?(1800).should be_false
  end
end
