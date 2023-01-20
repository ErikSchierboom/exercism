require "spec"
require "../src/*"

describe "PerfectNumbers" do
  it "Smallest perfect number is classified correctly" do
    PerfectNumbers.classify(6).should eq("perfect")
  end

  it "Medium perfect number is classified correctly" do
    PerfectNumbers.classify(28).should eq("perfect")
  end

  it "Large perfect number is classified correctly" do
    PerfectNumbers.classify(33550336).should eq("perfect")
  end

  it "Smallest abundant number is classified correctly" do
    PerfectNumbers.classify(12).should eq("abundant")
  end

  it "Medium abundant number is classified correctly" do
    PerfectNumbers.classify(30).should eq("abundant")
  end

  it "Large abundant number is classified correctly" do
    PerfectNumbers.classify(33550335).should eq("abundant")
  end

  it "Smallest prime deficient number is classified correctly" do
    PerfectNumbers.classify(2).should eq("deficient")
  end

  it "Smallest non-prime deficient number is classified correctly" do
    PerfectNumbers.classify(4).should eq("deficient")
  end

  it "Medium deficient number is classified correctly" do
    PerfectNumbers.classify(32).should eq("deficient")
  end

  it "Large deficient number is classified correctly" do
    PerfectNumbers.classify(33550337).should eq("deficient")
  end

  it "Edge case (no factors other than itself) is classified correctly" do
    PerfectNumbers.classify(1).should eq("deficient")
  end

  it "Zero is rejected (as it is not a positive integer)" do
    expect_raises(ArgumentError) do
      PerfectNumbers.classify(0)
    end
  end

  it "Negative integer is rejected (as it is not a positive integer)" do
    expect_raises(ArgumentError) do
      PerfectNumbers.classify(-1)
    end
  end
end
