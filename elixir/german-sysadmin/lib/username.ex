defmodule Username do
  @spec sanitize(charlist()) :: charlist
  def sanitize(username) do
    username
    |> Enum.flat_map(&german_to_latin/1)
    |> Enum.filter(&supported_codepoint?/1)
  end

  defp german_to_latin(codepoint) do
    case codepoint do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      _ -> [codepoint]
    end
  end

  defp supported_codepoint?(?_), do: true
  defp supported_codepoint?(codepoint), do: codepoint >= ?a and codepoint <= ?z
end
