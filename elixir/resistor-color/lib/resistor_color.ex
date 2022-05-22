defmodule ResistorColor do
  @codes ~w(black brown red orange yellow green blue violet grey white)a

  def code(color), do: Enum.find_index(@codes, &(&1 == color))
end
