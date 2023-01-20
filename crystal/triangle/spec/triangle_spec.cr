require "spec"
require "../src/*"

describe "Triangle" do
  it "all sides are equal" do
    Triangle.new({2, 2, 2}).equilateral?.should be_true
  end

  it "any side is unequal" do
    Triangle.new({2, 3, 2}).equilateral?.should be_false
  end

  it "no sides are equal" do
    Triangle.new({5, 4, 6}).equilateral?.should be_false
  end

  it "all zero sides is not a triangle" do
    expect_raises(ArgumentError) do
      Triangle.new({0, 0, 0})
    end
  end

  it "sides may be floats" do
    Triangle.new({0.5, 0.5, 0.5}).equilateral?.should be_true
  end

  it "last two sides are equal" do
    Triangle.new({3, 4, 4}).isosceles?.should be_true
  end

  it "first two sides are equal" do
    Triangle.new({4, 4, 3}).isosceles?.should be_true
  end

  it "first and last sides are equal" do
    Triangle.new({4, 3, 4}).isosceles?.should be_true
  end

  it "equilateral triangles are also isosceles" do
    Triangle.new({4, 4, 4}).isosceles?.should be_true
  end

  it "no sides are equal" do
    Triangle.new({2, 3, 4}).isosceles?.should be_false
  end

  it "first triangle inequality violation" do
    expect_raises(ArgumentError) do
      Triangle.new({1, 1, 3})
    end
  end

  it "second triangle inequality violation" do
    expect_raises(ArgumentError) do
      Triangle.new({1, 3, 1})
    end
  end

  it "third triangle inequality violation" do
    expect_raises(ArgumentError) do
      Triangle.new({3, 1, 1})
    end
  end

  it "sides may be floats" do
    Triangle.new({0.5, 0.4, 0.5}).isosceles?.should be_true
  end

  it "no sides are equal" do
    Triangle.new({5, 4, 6}).scalene?.should be_true
  end

  it "all sides are equal" do
    Triangle.new({4, 4, 4}).scalene?.should be_false
  end

  it "first and second sides are equal" do
    Triangle.new({4, 4, 3}).scalene?.should be_false
  end

  it "first and third sides are equal" do
    Triangle.new({3, 4, 3}).scalene?.should be_false
  end

  it "second and third sides are equal" do
    Triangle.new({4, 3, 3}).scalene?.should be_false
  end

  it "may not violate triangle inequality" do
    expect_raises(ArgumentError) do
      Triangle.new({7, 3, 2})
    end
  end

  it "sides may be floats" do
    Triangle.new({0.5, 0.4, 0.6}).scalene?.should be_true
  end
end
