defmodule Frequency do
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Stream.chunk_every(workers, workers)
    |> Stream.map(&Task.async(fn -> frequency(&1) end))
    |> Stream.map(&Task.await/1)
    |> Enum.reduce(%{}, &Map.merge(&1, &2, fn _, count1, count2 -> count1 + count2 end))
  end

  def frequency(texts) do
    texts
    |> Enum.join()
    |> String.downcase()
    |> String.replace(~r/[^\p{L}]/u, "")
    |> String.graphemes()
    |> Enum.frequencies()
  end
end
