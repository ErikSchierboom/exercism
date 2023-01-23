require "spec"
require "../src/*"

describe "NthPrime" do
  it "first prime" do
    NthPrime.prime(1).should eq(2)
  end

  it "second prime" do
    NthPrime.prime(2).should eq(3)
  end

  it "sixth prime" do
    NthPrime.prime(6).should eq(13)
  end

  it "big prime" do
    NthPrime.prime(10001).should eq(104743)
  end

  it "there is no zeroth prime" do
    expect_raises(ArgumentError) do
      NthPrime.prime(0)
    end
  end
end
