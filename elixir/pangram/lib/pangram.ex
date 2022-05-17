defmodule Pangram do
  @alphabet MapSet.new(?a..?z)

  def pangram?(sentence) do
    letters = sentence |> String.downcase() |> String.to_charlist() |> MapSet.new()
    MapSet.subset?(@alphabet, letters)
  end
end
