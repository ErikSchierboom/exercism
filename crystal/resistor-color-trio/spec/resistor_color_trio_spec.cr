require "spec"
require "../src/*"

describe "ResistorColorTrio" do
  it "Orange and orange and black" do
    ResistorColorTrio.label(["orange", "orange", "black"]).should eq("33 ohms")
  end

  it "Blue and grey and brown" do
    ResistorColorTrio.label(["blue", "grey", "brown"]).should eq("680 ohms")
  end

  it "Red and black and red" do
    ResistorColorTrio.label(["red", "black", "red"]).should eq("2 kiloohms")
  end

  it "Green and brown and orange" do
    ResistorColorTrio.label(["green", "brown", "orange"]).should eq("51 kiloohms")
  end

  it "Yellow and violet and yellow" do
    ResistorColorTrio.label(["yellow", "violet", "yellow"]).should eq("470 kiloohms")
  end

  it "Blue and violet and blue" do
    ResistorColorTrio.label(["blue", "violet", "blue"]).should eq("67 megaohms")
  end

  it "Minimum possible value" do
    ResistorColorTrio.label(["black", "black", "black"]).should eq("0 ohms")
  end

  it "Maximum possible value" do
    ResistorColorTrio.label(["white", "white", "white"]).should eq("99 gigaohms")
  end

  it "First two colors make an invalid octal number" do
    ResistorColorTrio.label(["black", "grey", "black"]).should eq("8 ohms")
  end

  it "Ignore extra colors" do
    ResistorColorTrio.label(["blue", "green", "yellow", "orange"]).should eq("650 kiloohms")
  end
end
