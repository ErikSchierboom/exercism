defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    distance = :math.sqrt(x * x + y * y)

    cond do
      distance <=  1.0 -> 10
      distance <=  5.0 -> 5
      distance <= 10.0 -> 1
      true -> 0
    end
  end
end
