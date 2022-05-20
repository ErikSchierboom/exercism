defmodule FlattenArray do
  def flatten(list), do: List.flatten(list) |> Enum.filter(&(&1 != nil))
end
