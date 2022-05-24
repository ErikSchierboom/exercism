defmodule Gigasecond do
  def from({{year, month, day}, {hours, minutes, seconds}}) do
    NaiveDateTime.new!(year, month, day, hours, minutes, seconds)
    |> NaiveDateTime.add(1_000_000_000)
    |> then(&{{&1.year, &1.month, &1.day}, {&1.hour, &1.minute, &1.second}})
  end
end
