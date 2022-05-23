defmodule Isogram do
  def isogram?(sentence) do
    letters = Regex.scan(~r/[[:alpha:]]/, String.downcase(sentence)) |> List.flatten()
    length(letters) == length(letters |> Enum.uniq())
  end
end
