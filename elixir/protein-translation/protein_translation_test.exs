if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("protein_translation.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule ProteinTranslationTest do
  use ExUnit.Case

  test "AUG translates to methionine" do
    assert ProteinTranslation.of_codon("AUG") == {:ok, "Methionine"}
  end

  test "identifies Phenylalanine codons" do
    assert ProteinTranslation.of_codon("UUU") == {:ok, "Phenylalanine"}
    assert ProteinTranslation.of_codon("UUC") == {:ok, "Phenylalanine"}
  end

  test "identifies Leucine codons" do
    assert ProteinTranslation.of_codon("UUA") == {:ok, "Leucine"}
    assert ProteinTranslation.of_codon("UUG") == {:ok, "Leucine"}
  end

  test "identifies Serine codons" do
    assert ProteinTranslation.of_codon("UCU") == {:ok, "Serine"}
    assert ProteinTranslation.of_codon("UCC") == {:ok, "Serine"}
    assert ProteinTranslation.of_codon("UCA") == {:ok, "Serine"}
    assert ProteinTranslation.of_codon("UCG") == {:ok, "Serine"}
  end

  test "identifies Tyrosine codons" do
    assert ProteinTranslation.of_codon("UAU") == {:ok, "Tyrosine"}
    assert ProteinTranslation.of_codon("UAC") == {:ok, "Tyrosine"}
  end

  test "identifies Cysteine codons" do
    assert ProteinTranslation.of_codon("UGU") == {:ok, "Cysteine"}
    assert ProteinTranslation.of_codon("UGC") == {:ok, "Cysteine"}
  end

  test "identifies Tryptophan codons" do
    assert ProteinTranslation.of_codon("UGG") == {:ok, "Tryptophan"}
  end

  test "identifies stop codons" do
    assert ProteinTranslation.of_codon("UAA") == {:ok, "STOP"}
    assert ProteinTranslation.of_codon("UAG") == {:ok, "STOP"}
    assert ProteinTranslation.of_codon("UGA") == {:ok, "STOP"}
  end

  test "translates rna strand into correct protein" do
    strand = "AUGUUUUGG"
    assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Methionine Phenylalanine Tryptophan)}
  end

  test "stops translation if stop codon present" do
    strand = "AUGUUUUAA"
    assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Methionine Phenylalanine)}
  end

  test "stops translation of longer strand" do
    strand = "UGGUGUUAUUAAUGGUUU"
    assert ProteinTranslation.of_rna(strand) == {:ok, ~w(Tryptophan Cysteine Tyrosine)}
  end

  test "invalid RNA" do
    assert ProteinTranslation.of_rna("CARROT") == {:error, "invalid RNA"}
  end

  test "invalid codon at end of RNA" do
    assert ProteinTranslation.of_rna("UUUROT") == {:error, "invalid RNA"}
  end

  test "invalid codon" do
    assert ProteinTranslation.of_codon("INVALID") == {:error, "invalid codon"}
  end
end
