if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("difference_of_squares.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule DifferenceOfSquaresTest do
  use ExUnit.Case

  test "square of sum to 5" do
    assert Squares.square_of_sum(5) == 225
  end

  test "sum of squares to 5" do
    assert Squares.sum_of_squares(5) == 55
  end

  test "difference of sum to 5" do
    assert Squares.difference(5) == 170
  end

  test "square of sum to 10" do
    assert Squares.square_of_sum(10) == 3025
  end

  test "sum of squares to 10" do
    assert Squares.sum_of_squares(10) == 385
  end

  test "difference of sum to 10" do
    assert Squares.difference(10) == 2640
  end

  test "square of sum to 100" do
    assert Squares.square_of_sum(100) == 25_502_500
  end

  test "sum of squares to 100" do
    assert Squares.sum_of_squares(100) == 338_350
  end

  test "difference of sum to 100" do
    assert Squares.difference(100) == 25_164_150
  end
end
