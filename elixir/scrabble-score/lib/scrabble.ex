defmodule Scrabble do
  def score(word) do
    word
    |> String.upcase()
    |> String.to_charlist()
    |> Enum.map(&letter_score/1)
    |> Enum.sum()
  end

  defp letter_score(letter) do
    cond do
      letter in [?A, ?E, ?I, ?O, ?U, ?L, ?N, ?R, ?S, ?T] -> 1
      letter in [?D, ?G] -> 2
      letter in [?B, ?C, ?M, ?P] -> 3
      letter in [?F, ?H, ?V, ?W, ?Y] -> 4
      letter in [?K] -> 5
      letter in [?J, ?X] -> 8
      letter in [?Q, ?Z] -> 10
      true -> 0
    end
  end
end
