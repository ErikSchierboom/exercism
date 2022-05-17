defmodule ProteinTranslation do
  def of_rna(rna) do
    rna
    |> String.graphemes()
    |> Enum.chunk_every(3, 3, [])
    |> Enum.map(&Enum.join/1)
    |> Enum.map(&of_codon/1)
    |> Enum.reduce_while({:ok, []}, fn
      {:ok, "STOP"}, {:ok, codons} ->
        {:halt, {:ok, codons}}

      {:ok, codon}, {:ok, codons} ->
        {:cont, {:ok, codons ++ [codon]}}

      {:error, "invalid codon"}, _ ->
        {:halt, {:error, "invalid RNA"}}
    end)
  end

  def of_codon("UGU"), do: {:ok, "Cysteine"}
  def of_codon("UGC"), do: {:ok, "Cysteine"}
  def of_codon("UUA"), do: {:ok, "Leucine"}
  def of_codon("UUG"), do: {:ok, "Leucine"}
  def of_codon("AUG"), do: {:ok, "Methionine"}
  def of_codon("UUU"), do: {:ok, "Phenylalanine"}
  def of_codon("UUC"), do: {:ok, "Phenylalanine"}
  def of_codon("UCU"), do: {:ok, "Serine"}
  def of_codon("UCC"), do: {:ok, "Serine"}
  def of_codon("UCA"), do: {:ok, "Serine"}
  def of_codon("UCG"), do: {:ok, "Serine"}
  def of_codon("UGG"), do: {:ok, "Tryptophan"}
  def of_codon("UAU"), do: {:ok, "Tyrosine"}
  def of_codon("UAC"), do: {:ok, "Tyrosine"}
  def of_codon("UAA"), do: {:ok, "STOP"}
  def of_codon("UAG"), do: {:ok, "STOP"}
  def of_codon("UGA"), do: {:ok, "STOP"}
  def of_codon(_), do: {:error, "invalid codon"}
end
