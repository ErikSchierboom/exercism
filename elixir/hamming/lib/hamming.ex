defmodule Hamming do
  def hamming_distance(strand1, strand2) when length(strand1) == length(strand2) do
    distance =
      Enum.zip_reduce(strand1, strand2, 0, fn a, b, distance ->
        if a == b, do: distance, else: distance + 1
      end)

    {:ok, distance}
  end

  def hamming_distance(_strand1, _strand2) do
    {:error, "strands must be of equal length"}
  end
end
