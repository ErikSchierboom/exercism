defmodule Bob do
  def hey(input) do
    cond do
      silence?(input) ->
        "Fine. Be that way!"

      question?(input) && shouting?(input) ->
        "Calm down, I know what I'm doing!"

      question?(input) ->
        "Sure."

      shouting?(input) ->
        "Whoa, chill out!"

      true ->
        "Whatever."
    end
  end

  defp silence?(input), do: String.trim(input) |> String.length() === 0
  defp question?(input), do: String.trim(input) |> String.ends_with?("?")
  defp shouting?(input), do: String.upcase(input) === input && has_letter?(input)

  defp has_letter?(str), do: str |> String.graphemes() |> Enum.any?(&is_letter?/1)
  defp is_letter?(c), do: c =~ ~r/\p{L}/u
end
