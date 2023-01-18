require "spec"
require "../src/*"

describe "LargestSeriesProduct" do
  it "finds the largest product if span equals length" do
    series = Series.new("29")
    series.largest_product(2).should eq(18)
  end

  it "can find the largest product of 2 with numbers in order" do
    series = Series.new("0123456789")
    series.largest_product(2).should eq(72)
  end

  it "can find the largest product of 2" do
    series = Series.new("576802143")
    series.largest_product(2).should eq(48)
  end

  it "can find the largest product of 3 with numbers in order" do
    series = Series.new("0123456789")
    series.largest_product(3).should eq(504)
  end

  it "can find the largest product of 3" do
    series = Series.new("1027839564")
    series.largest_product(3).should eq(270)
  end

  it "can find the largest product of 5 with numbers in order" do
    series = Series.new("0123456789")
    series.largest_product(5).should eq(15120)
  end

  it "can get the largest product of a big number" do
    series = Series.new("73167176531330624919225119674426574742355349194934")
    series.largest_product(6).should eq(23520)
  end

  it "reports zero if the only digits are zero" do
    series = Series.new("0000")
    series.largest_product(2).should eq(0)
  end

  it "reports zero if all spans include zero" do
    series = Series.new("99099")
    series.largest_product(3).should eq(0)
  end

  it "rejects span longer than string length" do
    series = Series.new("123")
    expect_raises(ArgumentError) do
      series.largest_product(4)
    end
  end

  it "reports 1 for empty string and empty product (0 span)" do
    series = Series.new("")
    series.largest_product(0).should eq(1)
  end

  it "reports 1 for nonempty string and empty product (0 span)" do
    series = Series.new("123")
    series.largest_product(0).should eq(1)
  end

  it "rejects empty string and nonzero span" do
    series = Series.new("")
    expect_raises(ArgumentError) do
      series.largest_product(1)
    end
  end

  it "rejects invalid character in digits" do
    expect_raises(ArgumentError) do
      series = Series.new("1234a5")
    end
  end

  it "rejects negative span" do
    series = Series.new("12345")
    expect_raises(ArgumentError) do
      series.largest_product(-1)
    end
  end
end
