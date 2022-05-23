defmodule ArmstrongNumber do
  def valid?(number) do
    digits = Integer.digits(number)
    digits |> Enum.map(&(&1 ** Enum.count(digits))) |> Enum.sum() == number
  end
end
