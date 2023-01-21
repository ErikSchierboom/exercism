require "spec"
require "../src/*"

describe "MatchingBrackets" do
  it "paired square brackets" do
    MatchingBrackets.valid?("[]").should be_true
  end

  it "empty string" do
    MatchingBrackets.valid?("").should be_true
  end

  it "unpaired brackets" do
    MatchingBrackets.valid?("[[").should be_false
  end

  it "wrong ordered brackets" do
    MatchingBrackets.valid?("}{").should be_false
  end

  it "wrong closing bracket" do
    MatchingBrackets.valid?("{]").should be_false
  end

  it "paired with whitespace" do
    MatchingBrackets.valid?("{ }").should be_true
  end

  it "partially paired brackets" do
    MatchingBrackets.valid?("{[])").should be_false
  end

  it "simple nested brackets" do
    MatchingBrackets.valid?("{[]}").should be_true
  end

  it "several paired brackets" do
    MatchingBrackets.valid?("{}[]").should be_true
  end

  it "paired and nested brackets" do
    MatchingBrackets.valid?("([{}({}[])])").should be_true
  end

  it "unopened closing brackets" do
    MatchingBrackets.valid?("{[)][]}").should be_false
  end

  it "unpaired and nested brackets" do
    MatchingBrackets.valid?("([{])").should be_false
  end

  it "paired and wrong nested brackets" do
    MatchingBrackets.valid?("[({]})").should be_false
  end

  it "paired and wrong nested brackets but innermost are correct" do
    MatchingBrackets.valid?("[({}])").should be_false
  end

  it "paired and incomplete brackets" do
    MatchingBrackets.valid?("{}[").should be_false
  end

  it "too many closing brackets" do
    MatchingBrackets.valid?("[]]").should be_false
  end

  it "early unexpected brackets" do
    MatchingBrackets.valid?(")()").should be_false
  end

  it "early mismatched brackets" do
    MatchingBrackets.valid?("{)()").should be_false
  end

  it "math expression" do
    MatchingBrackets.valid?("(((185 + 223.85) * 15) - 543)/2").should be_true
  end

  it "complex latex expression" do
    MatchingBrackets.valid?("left(\begin{array}{cc} \frac{1}{3} & x\\ mathrm{e}^{x} &... x^2 \end{array}\right)").should be_true
  end
end
