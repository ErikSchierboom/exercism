defmodule Atbash do
  @alphabet ?a..?z
  @encoding_map Enum.zip(@alphabet, Enum.reverse(@alphabet)) |> Map.new()

  def encode(plaintext) do
    plaintext
    |> String.downcase()
    |> String.replace(~r/[^\w]/, "")
    |> String.to_charlist()
    |> Enum.chunk_every(5)
    |> Enum.map(fn chunk -> chunk |> Enum.map(&encode_char/1) |> List.to_string() end)
    |> Enum.join(" ")
  end

  def decode(cipher), do: encode(cipher) |> String.replace(~r/[^\w]/, "")

  defp encode_char(char), do: Map.get(@encoding_map, char, char)
end
