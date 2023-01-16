require "spec"
require "../src/*"

describe "SumOfMultiples" do
  it "no multiples within limit" do
    SumOfMultiples.sum([3, 5], 1).should eq(0)
  end

  it "one factor has multiples within limit" do
    SumOfMultiples.sum([3, 5], 4).should eq(3)
  end

  it "more than one multiple within limit" do
    SumOfMultiples.sum([3], 7).should eq(9)
  end

  it "more than one factor with multiples within limit" do
    SumOfMultiples.sum([3, 5], 10).should eq(23)
  end

  it "each multiple is only counted once" do
    SumOfMultiples.sum([3, 5], 100).should eq(2318)
  end

  it "a much larger limit" do
    SumOfMultiples.sum([3, 5], 1000).should eq(233168)
  end

  it "three factors" do
    SumOfMultiples.sum([7, 13, 17], 20).should eq(51)
  end

  it "factors not relatively prime" do
    SumOfMultiples.sum([4, 6], 15).should eq(30)
  end

  it "some pairs of factors relatively prime and some not" do
    SumOfMultiples.sum([5, 6, 8], 150).should eq(4419)
  end

  it "one factor is a multiple of another" do
    SumOfMultiples.sum([5, 25], 51).should eq(275)
  end

  it "much larger factors" do
    SumOfMultiples.sum([43, 47], 10000).should eq(2203160)
  end

  it "all numbers are multiples of 1" do
    SumOfMultiples.sum([1], 100).should eq(4950)
  end

  it "no factors means an empty sum" do
    SumOfMultiples.sum([] of Int32, 10000).should eq(0)
  end

  it "the only multiple of 0 is 0" do
    SumOfMultiples.sum([0], 1).should eq(0)
  end

  it "the factor 0 does not affect the sum of multiples of other factors" do
    SumOfMultiples.sum([3, 0], 4).should eq(3)
  end

  it "solutions using include-exclude must extend to cardinality greater than 3" do
    SumOfMultiples.sum([2, 3, 5, 7, 11], 10000).should eq(39614537)
  end
end
