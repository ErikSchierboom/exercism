defmodule Clock do
  defstruct hour: 0, minute: 0

  @minutes_per_day 1440
  @minutes_per_hour 60

  def new(hour, minute) do
    minutes_in_day = Integer.mod(hour * @minutes_per_hour + minute, @minutes_per_day)

    %Clock{
      hour: div(minutes_in_day, @minutes_per_hour),
      minute: rem(minutes_in_day, @minutes_per_hour)
    }
  end

  def add(%Clock{hour: hour, minute: minute}, add_minute) do
    new(hour, minute + add_minute)
  end

  defimpl String.Chars do
    def to_string(%Clock{hour: hour, minute: minute}) do
      :io_lib.format("~2..0w:~2..0w", [hour, minute]) |> Kernel.to_string()
    end
  end
end
