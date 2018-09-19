if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("leap.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule LeapTest do
  use ExUnit.Case

  test "vanilla leap year" do
    assert Year.leap_year?(1996)
  end

  test "any old year" do
    refute Year.leap_year?(1997), "1997 is not a leap year."
  end

  test "century" do
    refute Year.leap_year?(1900), "1900 is not a leap year."
  end

  test "exceptional century" do
    assert Year.leap_year?(2400)
  end
end
