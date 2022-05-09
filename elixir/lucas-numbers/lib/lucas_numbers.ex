defmodule LucasNumbers do
  def generate(count) when is_integer(count) and count >= 1 do
    Stream.unfold({2, 1}, fn {l, r} ->
      {l, {r, l + r}}
    end)
    |> Enum.take(count)
  end

  def generate(_count),
    do: raise(ArgumentError, message: "count must be specified as an integer >= 1")
end
