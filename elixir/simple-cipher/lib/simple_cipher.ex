defmodule SimpleCipher do
  @alphabet ?a..?z

  def encode(plaintext, key) do
    shift(plaintext, key, &Kernel.+/2)
  end

  def decode(ciphertext, key) do
    shift(ciphertext, key, &Kernel.-/2)
  end

  defp shift(text, key, operation) do
    key = String.to_charlist(key)

    text
    |> String.to_charlist()
    |> Enum.with_index(fn c, i ->
      alphabet_index = Enum.find_index(@alphabet, &(&1 == c))
      key_index = Enum.find_index(@alphabet, &(&1 == Enum.at(key, rem(i, Enum.count(key)))))
      shifted_index = rem(operation.(alphabet_index, key_index), Enum.count(@alphabet))
      Enum.at(@alphabet, shifted_index)
    end)
    |> to_string()
  end

  def generate_key(length) do
    letters = for _ <- 1..length, do: Enum.random(@alphabet)
    letters |> to_string()
  end
end
