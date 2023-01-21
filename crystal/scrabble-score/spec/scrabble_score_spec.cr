require "spec"
require "../src/*"

describe "ScrabbleScore" do
  it "lowercase letter" do
    ScrabbleScore.score("a").should eq(1)
  end

  it "uppercase letter" do
    ScrabbleScore.score("A").should eq(1)
  end

  it "valuable letter" do
    ScrabbleScore.score("f").should eq(4)
  end

  it "short word" do
    ScrabbleScore.score("at").should eq(2)
  end

  it "short, valuable word" do
    ScrabbleScore.score("zoo").should eq(12)
  end

  it "medium word" do
    ScrabbleScore.score("street").should eq(6)
  end

  it "medium, valuable word" do
    ScrabbleScore.score("quirky").should eq(22)
  end

  it "long, mixed-case word" do
    ScrabbleScore.score("OxyphenButazone").should eq(41)
  end

  it "english-like word" do
    ScrabbleScore.score("pinata").should eq(8)
  end

  it "empty input" do
    ScrabbleScore.score("").should eq(0)
  end

  it "entire alphabet available" do
    ScrabbleScore.score("abcdefghijklmnopqrstuvwxyz").should eq(87)
  end
end
