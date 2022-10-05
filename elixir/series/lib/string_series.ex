defmodule StringSeries do
  def slices(s, size) when size > 0 do
    s
    |> String.codepoints()
    |> Enum.chunk_every(size, 1, :discard)
    |> Enum.map(&to_string/1)
  end

  def slices(_s, _size), do: []
end
