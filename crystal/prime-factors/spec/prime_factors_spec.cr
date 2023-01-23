require "spec"
require "../src/*"

describe "PrimeFactors" do
  it "no factors" do
    PrimeFactors.factors(1).should eq([] of Int32)
  end

  it "prime number" do
    PrimeFactors.factors(2).should eq([2] of Int32)
  end

  it "another prime number" do
    PrimeFactors.factors(3).should eq([3] of Int32)
  end

  it "square of a prime" do
    PrimeFactors.factors(9).should eq([3, 3] of Int32)
  end

  it "product of first prime" do
    PrimeFactors.factors(4).should eq([2, 2] of Int32)
  end

  it "cube of a prime" do
    PrimeFactors.factors(8).should eq([2, 2, 2] of Int32)
  end

  it "product of second prime" do
    PrimeFactors.factors(27).should eq([3, 3, 3] of Int32)
  end

  it "product of third prime" do
    PrimeFactors.factors(625).should eq([5, 5, 5, 5] of Int32)
  end

  it "product of first and second prime" do
    PrimeFactors.factors(6).should eq([2, 3] of Int32)
  end

  it "product of primes and non-primes" do
    PrimeFactors.factors(12).should eq([2, 2, 3] of Int32)
  end

  it "product of primes" do
    PrimeFactors.factors(901255).should eq([5, 17, 23, 461] of Int32)
  end

  it "factors include a large prime" do
    PrimeFactors.factors(93819012551).should eq([11, 9539, 894119] of Int32)
  end
end
