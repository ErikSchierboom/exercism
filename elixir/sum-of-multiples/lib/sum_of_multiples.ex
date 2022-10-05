defmodule SumOfMultiples do
  def to(limit, factors) do
    1..(limit - 1)
    |> Enum.filter(fn n -> Enum.any?(factors, &multiple?(n, &1)) end)
    |> Enum.sum()
  end

  defp multiple?(_, 0), do: false
  defp multiple?(n, m), do: rem(n, m) == 0
end
