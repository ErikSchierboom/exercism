defmodule RnaTranscription do
  def to_rna(dna), do: Enum.map(dna, &to_complement/1)

  defp to_complement(?G), do: ?C
  defp to_complement(?C), do: ?G
  defp to_complement(?T), do: ?A
  defp to_complement(?A), do: ?U
end
