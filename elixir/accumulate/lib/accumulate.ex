defmodule Accumulate do
  @spec accumulate(list, (any -> any)) :: list
  def accumulate([head | tail], fun) do
    [fun.(head) | accumulate(tail, fun)]
  end

  def accumulate([], _), do: []
end
