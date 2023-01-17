require "spec"
require "../src/*"

describe "Hamming" do
  it "empty strands" do
    Hamming.distance("", "").should eq(0)
  end

  it "single letter identical strands" do
    Hamming.distance("A", "A").should eq(0)
  end

  it "single letter different strands" do
    Hamming.distance("G", "T").should eq(1)
  end

  it "long identical strands" do
    Hamming.distance("GGACTGAAATCTG", "GGACTGAAATCTG").should eq(0)
  end

  it "long different strands" do
    Hamming.distance("GGACGGATTCTG", "AGGACGGATTCT").should eq(9)
  end

  it "disallow first strand longer" do
    expect_raises(ArgumentError) do
      Hamming.distance("AATG", "AAA")
    end
  end

  it "disallow second strand longer" do
    expect_raises(ArgumentError) do
      Hamming.distance("ATA", "AGTG")
    end
  end

  it "disallow left empty strand" do
    expect_raises(ArgumentError) do
      Hamming.distance("", "G")
    end
  end

  it "disallow right empty strand" do
    expect_raises(ArgumentError) do
      Hamming.distance("G", "")
    end
  end
end
