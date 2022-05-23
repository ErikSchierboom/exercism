defmodule Hamming do
  def hamming_distance(strand1, strand2) do
    if Enum.count(strand1) == Enum.count(strand2) do
      {:ok,
       Enum.zip_reduce(strand1, strand2, 0, fn a, b, distance ->
         if a == b, do: distance, else: distance + 1
       end)}
    else
      {:error, "strands must be of equal length"}
    end
  end
end
