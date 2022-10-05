defmodule RunLengthEncoder do
  def encode(string) do
    Regex.scan(~r/(.)\1*/, string)
    |> Enum.map(fn
      [letter, letter] -> letter
      [letters, letter] -> "#{String.length(letters)}#{letter}"
    end)
    |> Enum.join()
  end

  def decode(string) do
    Regex.scan(~r/(\d*)(.)/, string)
    |> Enum.map(fn
      [_, "", letter] -> letter
      [_, count, letter] -> String.duplicate(letter, String.to_integer(count))
    end)
    |> Enum.join()
  end
end
