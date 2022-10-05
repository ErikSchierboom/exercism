defmodule RotationalCipher do
  @lower_alphabet Enum.to_list(?a..?z)
  @upper_alphabet Enum.to_list(?A..?Z)

  def rotate(text, shift) do
    letter_map = rotate_map(shift)

    text
    |> String.to_charlist()
    |> Enum.map(&Map.get(letter_map, &1, &1))
    |> List.to_string()
  end

  defp rotate_map(shift) do
    Map.merge(shift_map(@lower_alphabet, shift), shift_map(@upper_alphabet, shift))
  end

  defp shift_map(enum, shift) do
    Enum.zip(enum, shift_by(enum, shift)) |> Map.new()
  end

  defp shift_by(enum, by) do
    Enum.drop(enum, by) ++ Enum.take(enum, by)
  end
end
