require "spec"
require "../src/*"

describe "Series" do
  it "slices of one from one" do
    Series.slices("1", 1).should eq(["1"])
  end

  it "slices of one from two" do
    Series.slices("12", 1).should eq(["1", "2"])
  end

  it "slices of two" do
    Series.slices("35", 2).should eq(["35"])
  end

  it "slices of two overlap" do
    Series.slices("9142", 2).should eq(["91", "14", "42"])
  end

  it "slices can include duplicates" do
    Series.slices("777777", 3).should eq(["777", "777", "777", "777"])
  end

  it "slices of a long series" do
    Series.slices("918493904243", 5).should eq(["91849", "18493", "84939", "49390", "93904", "39042", "90424", "04243"])
  end

  it "slice length is too large" do
    expect_raises(ArgumentError) do
      Series.slices("12345", 6)
    end
  end

  it "slice length is way too large" do
    expect_raises(ArgumentError) do
      Series.slices("12345", 42)
    end
  end

  it "slice length cannot be zero" do
    expect_raises(ArgumentError) do
      Series.slices("12345", 0)
    end
  end

  it "slice length cannot be negative" do
    expect_raises(ArgumentError) do
      Series.slices("123", -1)
    end
  end

  it "empty series is invalid" do
    expect_raises(ArgumentError) do
      Series.slices("", 1)
    end
  end
end
