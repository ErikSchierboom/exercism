defmodule ResistorColorDuo do
  @codes ~w(black brown red orange yellow green blue violet grey white)a

  def value([first | [second | _]]) do
    code(first) * 10 + code(second)
  end

  defp code(color), do: Enum.find_index(@codes, &(&1 == color))
end
