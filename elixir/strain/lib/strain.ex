defmodule Strain do
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    for element <- list, fun.(element), do: element
  end

  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    keep(list, &(not fun.(&1)))
  end
end
