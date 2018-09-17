defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string |> words |> Enum.map(&acronym_letter/1) |> Enum.join("")
  end

  defp words(string), do: Regex.scan(~r/[A-Z]+[a-z]*|[a-z]+/, string) |> Enum.concat()

  defp acronym_letter(string), do: String.first(string) |> String.upcase()
end
