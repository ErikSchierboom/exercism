require "spec"
require "../src/*"

describe "ReverseString" do
  it "an empty string" do
    ReverseString.reverse("").should eq("")
  end

  it "a word" do
    ReverseString.reverse("robot").should eq("tobor")
  end

  it "a capitalized word" do
    ReverseString.reverse("Ramen").should eq("nemaR")
  end

  it "a sentence with punctuation" do
    ReverseString.reverse("I'm hungry!").should eq("!yrgnuh m'I")
  end

  it "a palindrome" do
    ReverseString.reverse("racecar").should eq("racecar")
  end

  it "an even-sized word" do
    ReverseString.reverse("drawer").should eq("reward")
  end
end
