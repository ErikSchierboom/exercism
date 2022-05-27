defmodule BeerSong do
  def verse(n), do: "#{current(n)}\n#{next(n)}\n"
  def lyrics(range \\ 99..0), do: range |> Enum.map(&verse/1) |> Enum.join("\n")

  defp current(n), do: "#{bottles(n) |> String.capitalize()} of beer on the wall, #{bottles(n)} of beer."
  defp next(n), do: "#{action(n)}, #{bottles(Integer.mod(n - 1, 100))} of beer on the wall."

  defp bottles(0), do: "no more bottles"
  defp bottles(1), do: "1 bottle"
  defp bottles(n), do: "#{n} bottles"

  defp action(0), do: "Go to the store and buy some more"
  defp action(n), do: "Take #{subject(n)} down and pass it around"

  defp subject(1), do: "it"
  defp subject(_), do: "one"
end
