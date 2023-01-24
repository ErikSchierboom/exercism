require "spec"
require "../src/*"

describe "RotationalCipher" do
  it "rotate a by 0, same output as input" do
    RotationalCipher.rotate("a", 0).should eq("a")
  end

  it "rotate a by 1" do
    RotationalCipher.rotate("a", 1).should eq("b")
  end

  it "rotate a by 26, same output as input" do
    RotationalCipher.rotate("a", 26).should eq("a")
  end

  it "rotate m by 13" do
    RotationalCipher.rotate("m", 13).should eq("z")
  end

  it "rotate n by 13 with wrap around alphabet" do
    RotationalCipher.rotate("n", 13).should eq("a")
  end

  it "rotate capital letters" do
    RotationalCipher.rotate("OMG", 5).should eq("TRL")
  end

  it "rotate spaces" do
    RotationalCipher.rotate("O M G", 5).should eq("T R L")
  end

  it "rotate numbers" do
    RotationalCipher.rotate("Testing 1 2 3 testing", 4).should eq("Xiwxmrk 1 2 3 xiwxmrk")
  end

  it "rotate punctuation" do
    RotationalCipher.rotate("Let's eat, Grandma!", 21).should eq("Gzo'n zvo, Bmviyhv!")
  end

  it "rotate all letters" do
    RotationalCipher.rotate("The quick brown fox jumps over the lazy dog.", 13).should eq("Gur dhvpx oebja sbk whzcf bire gur ynml qbt.")
  end
end
