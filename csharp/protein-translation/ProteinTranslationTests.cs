using Xunit;

public class ProteinTranslationTests
{
    [Fact]
    public void Empty_rna_sequence_results_in_no_proteins()
    {
        Assert.Empty(ProteinTranslation.Proteins(""));
    }

    [Fact]
    public void Methionine_rna_sequence()
    {
        Assert.Equal(new[] { "Methionine" }, ProteinTranslation.Proteins("AUG"));
    }

    [Fact]
    public void Phenylalanine_rna_sequence_1()
    {
        Assert.Equal(new[] { "Phenylalanine" }, ProteinTranslation.Proteins("UUU"));
    }

    [Fact]
    public void Phenylalanine_rna_sequence_2()
    {
        Assert.Equal(new[] { "Phenylalanine" }, ProteinTranslation.Proteins("UUC"));
    }

    [Fact]
    public void Leucine_rna_sequence_1()
    {
        Assert.Equal(new[] { "Leucine" }, ProteinTranslation.Proteins("UUA"));
    }

    [Fact]
    public void Leucine_rna_sequence_2()
    {
        Assert.Equal(new[] { "Leucine" }, ProteinTranslation.Proteins("UUG"));
    }

    [Fact]
    public void Serine_rna_sequence_1()
    {
        Assert.Equal(new[] { "Serine" }, ProteinTranslation.Proteins("UCU"));
    }

    [Fact]
    public void Serine_rna_sequence_2()
    {
        Assert.Equal(new[] { "Serine" }, ProteinTranslation.Proteins("UCC"));
    }

    [Fact]
    public void Serine_rna_sequence_3()
    {
        Assert.Equal(new[] { "Serine" }, ProteinTranslation.Proteins("UCA"));
    }

    [Fact]
    public void Serine_rna_sequence_4()
    {
        Assert.Equal(new[] { "Serine" }, ProteinTranslation.Proteins("UCG"));
    }

    [Fact]
    public void Tyrosine_rna_sequence_1()
    {
        Assert.Equal(new[] { "Tyrosine" }, ProteinTranslation.Proteins("UAU"));
    }

    [Fact]
    public void Tyrosine_rna_sequence_2()
    {
        Assert.Equal(new[] { "Tyrosine" }, ProteinTranslation.Proteins("UAC"));
    }

    [Fact]
    public void Cysteine_rna_sequence_1()
    {
        Assert.Equal(new[] { "Cysteine" }, ProteinTranslation.Proteins("UGU"));
    }

    [Fact]
    public void Cysteine_rna_sequence_2()
    {
        Assert.Equal(new[] { "Cysteine" }, ProteinTranslation.Proteins("UGC"));
    }

    [Fact]
    public void Tryptophan_rna_sequence()
    {
        Assert.Equal(new[] { "Tryptophan" }, ProteinTranslation.Proteins("UGG"));
    }

    [Fact]
    public void Stop_codon_rna_sequence_1()
    {
        Assert.Empty(ProteinTranslation.Proteins("UAA"));
    }

    [Fact]
    public void Stop_codon_rna_sequence_2()
    {
        Assert.Empty(ProteinTranslation.Proteins("UAG"));
    }

    [Fact]
    public void Stop_codon_rna_sequence_3()
    {
        Assert.Empty(ProteinTranslation.Proteins("UGA"));
    }

    [Fact]
    public void Sequence_of_two_protein_codons_translates_into_proteins()
    {
        Assert.Equal(new[] { "Phenylalanine", "Phenylalanine" }, ProteinTranslation.Proteins("UUUUUU"));
    }

    [Fact]
    public void Sequence_of_two_different_protein_codons_translates_into_proteins()
    {
        Assert.Equal(new[] { "Leucine", "Leucine" }, ProteinTranslation.Proteins("UUAUUG"));
    }

    [Fact]
    public void Translate_rna_strand_into_correct_protein_list()
    {
        Assert.Equal(new[] { "Methionine", "Phenylalanine", "Tryptophan" }, ProteinTranslation.Proteins("AUGUUUUGG"));
    }

    [Fact]
    public void Translation_stops_if_stop_codon_at_beginning_of_sequence()
    {
        Assert.Empty(ProteinTranslation.Proteins("UAGUGG"));
    }

    [Fact]
    public void Translation_stops_if_stop_codon_at_end_of_two_codon_sequence()
    {
        Assert.Equal(new[] { "Tryptophan" }, ProteinTranslation.Proteins("UGGUAG"));
    }

    [Fact]
    public void Translation_stops_if_stop_codon_at_end_of_three_codon_sequence()
    {
        Assert.Equal(new[] { "Methionine", "Phenylalanine" }, ProteinTranslation.Proteins("AUGUUUUAA"));
    }

    [Fact]
    public void Translation_stops_if_stop_codon_in_middle_of_three_codon_sequence()
    {
        Assert.Equal(new[] { "Tryptophan" }, ProteinTranslation.Proteins("UGGUAGUGG"));
    }

    [Fact]
    public void Translation_stops_if_stop_codon_in_middle_of_six_codon_sequence()
    {
        Assert.Equal(new[] { "Tryptophan", "Cysteine", "Tyrosine" }, ProteinTranslation.Proteins("UGGUGUUAUUAAUGGUUU"));
    }
}