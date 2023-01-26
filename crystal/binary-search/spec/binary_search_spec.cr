require "spec"
require "../src/*"

describe "BinarySearch" do
  it "finds a value in an array with one element" do
    binary = BinarySearch.new([6] of Int32)
    value = 6

    binary.find(value).should eq(0)
  end

  it "finds a value in the middle of an array" do
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11] of Int32)
    value = 6

    binary.find(value).should eq(3)
  end

  it "finds a value at the beginning of an array" do
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11] of Int32)
    value = 1

    binary.find(value).should eq(0)
  end

  it "finds a value at the end of an array" do
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11] of Int32)
    value = 11

    binary.find(value).should eq(6)
  end

  it "finds a value in an array of odd length" do
    binary = BinarySearch.new([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634] of Int32)
    value = 144

    binary.find(value).should eq(9)
  end

  it "finds a value in an array of even length" do
    binary = BinarySearch.new([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377] of Int32)
    value = 21

    binary.find(value).should eq(5)
  end

  it "identifies that a value is not included in the array" do
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11] of Int32)
    value = 7

    expect_raises(ArgumentError) do
      binary.find(value)
    end
  end

  it "a value smaller than the array's smallest value is not found" do
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11] of Int32)
    value = 0

    expect_raises(ArgumentError) do
      binary.find(value)
    end
  end

  it "a value larger than the array's largest value is not found" do
    binary = BinarySearch.new([1, 3, 4, 6, 8, 9, 11] of Int32)
    value = 13

    expect_raises(ArgumentError) do
      binary.find(value)
    end
  end

  it "nothing is found in an empty array" do
    binary = BinarySearch.new([] of Int32)
    value = 1

    expect_raises(ArgumentError) do
      binary.find(value)
    end
  end

  it "nothing is found when the left and right bounds cross" do
    binary = BinarySearch.new([1, 2] of Int32)
    value = 0

    expect_raises(ArgumentError) do
      binary.find(value)
    end
  end
end
