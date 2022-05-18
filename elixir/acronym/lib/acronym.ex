defmodule Acronym do
  def abbreviate(string) do
    Regex.split(~r/( |-|,|_)/, string, trim: true)
    |> Enum.map(&(&1 |> String.first() |> String.upcase()))
    |> Enum.join()
  end
end
