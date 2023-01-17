require "spec"
require "../src/*"

describe "Pangram" do
  it "empty sentence" do
    Pangram.pangram?("").should eq(false)
  end

  it "perfect lower case" do
    Pangram.pangram?("abcdefghijklmnopqrstuvwxyz").should eq(true)
  end

  it "only lower case" do
    Pangram.pangram?("the quick brown fox jumps over the lazy dog").should eq(true)
  end

  it "missing the letter 'x'" do
    Pangram.pangram?("a quick movement of the enemy will jeopardize five gunboats").should eq(false)
  end

  it "missing the letter 'h'" do
    Pangram.pangram?("five boxing wizards jump quickly at it").should eq(false)
  end

  it "with underscores" do
    Pangram.pangram?("the_quick_brown_fox_jumps_over_the_lazy_dog").should eq(true)
  end

  it "with numbers" do
    Pangram.pangram?("the 1 quick brown fox jumps over the 2 lazy dogs").should eq(true)
  end

  it "missing letters replaced by numbers" do
    Pangram.pangram?("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog").should eq(false)
  end

  it "mixed case and punctuation" do
    Pangram.pangram?("\"Five quacking Zephyrs jolt my wax bed.\"").should eq(true)
  end

  it "case insensitive" do
    Pangram.pangram?("the quick brown fox jumps over with lazy FX").should eq(false)
  end
end
