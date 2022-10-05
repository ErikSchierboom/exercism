defmodule Gigasecond do
  def from(date) do
    NaiveDateTime.from_erl!(date)
    |> NaiveDateTime.add(1_000_000_000)
    |> NaiveDateTime.to_erl()
  end
end
