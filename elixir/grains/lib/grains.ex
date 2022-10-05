defmodule Grains do
  def square(number) when number in 1..64 do
    {:ok, 2 ** (number - 1)}
  end
  def square(_number) do
    {:error, "The requested square must be between 1 and 64 (inclusive)"}
  end

  def total, do: {:ok, 2 ** 64 - 1}
end
