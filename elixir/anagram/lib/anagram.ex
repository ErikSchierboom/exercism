defmodule Anagram do
  def match(base, candidates) do
    candidates
    |> Enum.filter(&(to_normalized(&1) == to_normalized(base)))
    |> Enum.filter(&(String.downcase(base) != String.downcase(&1)))
  end

  defp to_normalized(str) do
    str
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end
