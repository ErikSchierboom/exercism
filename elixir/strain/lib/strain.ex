defmodule Strain do
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: keep(list, fun, [])

  defp keep([head | tail], fun, accumulator) do
    cond do
      fun.(head) -> keep(tail, fun, accumulator ++ [head])
      true -> keep(tail, fun, accumulator)
    end
  end

  defp keep([], _, accumulator), do: accumulator

  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    keep(list, &(not fun.(&1)))
  end
end
