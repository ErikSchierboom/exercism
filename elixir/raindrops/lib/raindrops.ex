defmodule Raindrops do
  @factors [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}]

  def convert(number) do
    case for {factor, word} <- @factors, rem(number, factor) == 0, do: word do
      [] -> to_string(number)
      words -> Enum.join(words)
    end
  end
end
