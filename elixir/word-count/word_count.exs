defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> words
    |> word_count
  end

  defp words(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/[\s_:,]+/)
    |> Enum.map(&normalize_word/1)
  end

  defp normalize_word(word), do: String.replace(word, ~r/[!&@$%^&]/, "")

  defp word_count(words),
    do: Enum.reduce(words, %{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
end
