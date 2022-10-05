defmodule Isogram do
  def isogram?(sentence) do
    letters = Regex.scan(~r/[[:alpha:]]/, String.downcase(sentence)) |> List.flatten()
    letters == Enum.uniq(letters)
  end
end
