require "spec"
require "../src/*"

describe "PascalsTriangle" do
  it "zero rows" do
    output = [] of Int32
    PascalsTriangle.rows(0).should eq(output)
  end

  it "single row" do
    output = [[1]]
    PascalsTriangle.rows(1).should eq(output)
  end

  it "two rows" do
    output = [[1], [1, 1]]
    PascalsTriangle.rows(2).should eq(output)
  end

  it "three rows" do
    output = [[1], [1, 1], [1, 2, 1]]
    PascalsTriangle.rows(3).should eq(output)
  end

  it "four rows" do
    output = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
    PascalsTriangle.rows(4).should eq(output)
  end

  it "five rows" do
    output = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
    PascalsTriangle.rows(5).should eq(output)
  end

  it "six rows" do
    output = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1]]
    PascalsTriangle.rows(6).should eq(output)
  end

  it "ten rows" do
    output = [
      [1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1], [1, 6, 15, 20, 15, 6, 1],
      [1, 7, 21, 35, 35, 21, 7, 1], [1, 8, 28, 56, 70, 56, 28, 8, 1], [1, 9, 36, 84, 126, 126, 84, 36, 9, 1],
    ]
    PascalsTriangle.rows(10).should eq(output)
  end
end
