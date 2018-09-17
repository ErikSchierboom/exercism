if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("two_fer.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule TwoFerTest do
  use ExUnit.Case

  test "no name given" do
    assert TwoFer.two_fer() == "One for you, one for me"
  end

  test "a name given" do
    assert TwoFer.two_fer("Gilberto Barros") == "One for Gilberto Barros, one for me"
  end

  test "when the parameter is a number" do
    assert_raise FunctionClauseError, fn ->
      TwoFer.two_fer(10)
    end
  end

  test "when the parameter is an atom" do
    assert_raise FunctionClauseError, fn ->
      TwoFer.two_fer(:bob)
    end
  end

  test "when the parameter is a charlist" do
    assert_raise FunctionClauseError, fn ->
      refute TwoFer.two_fer('Jon Snow')
    end
  end
end
