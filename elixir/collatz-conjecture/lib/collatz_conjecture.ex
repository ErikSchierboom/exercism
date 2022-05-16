defmodule CollatzConjecture do
  def calc(input) when is_integer(input), do: do_calc(input, 0)

  defp do_calc(1, steps), do: steps

  defp do_calc(input, steps) when input > 0 do
    if rem(input, 2) == 0 do
      do_calc(div(input, 2), steps + 1)
    else
      do_calc(input * 3 + 1, steps + 1)
    end
  end
end
