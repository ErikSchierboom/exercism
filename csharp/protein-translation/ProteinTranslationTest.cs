using System;
using NUnit.Framework;

[TestFixture]
public class ProteinTranslationTest
{
    [TestCase("AUG")]
    public void Identifies_methionine_codons(string codon)
    {
        Assert.That(ProteinTranslation.Translate(codon), Is.EquivalentTo(new[] { "Methionine" }));
    }

    [TestCase("UUU")]
    [TestCase("UUC")]
    public void Identifies_phenylalanine_codons(string codon)
    {
        Assert.That(ProteinTranslation.Translate(codon), Is.EquivalentTo(new[] { "Phenylalanine" }));
    }

    [TestCase("UUA")]
    [TestCase("UUG")]
    public void Identifies_leucine_codons(string codon)
    {
        Assert.That(ProteinTranslation.Translate(codon), Is.EquivalentTo(new[] { "Leucine" }));
    }

    [TestCase("UCU")]
    [TestCase("UCC")]
    [TestCase("UCA")]
    [TestCase("UCG")]
    public void Identifies_serine_codons(string codon)
    {
        Assert.That(ProteinTranslation.Translate(codon), Is.EquivalentTo(new[] { "Serine" }));
    }

    [TestCase("UAU")]
    [TestCase("UAC")]
    public void Identifies_tyrosine_codons(string codon)
    {
        Assert.That(ProteinTranslation.Translate(codon), Is.EquivalentTo(new[] { "Tyrosine" }));
    }

    [TestCase("UGU")]
    [TestCase("UGC")]
    public void Identifies_cysteine_codons(string codon)
    {
        Assert.That(ProteinTranslation.Translate(codon), Is.EquivalentTo(new[] { "Cysteine" }));
    }

    [TestCase("UGG")]
    public void Identifies_tryptophan_codons(string codon)
    {
        Assert.That(ProteinTranslation.Translate(codon), Is.EquivalentTo(new[] { "Tryptophan" }));
    }

    [Test]
    public void Translates_rna_strand_into_correct_protein()
    {
        Assert.That(ProteinTranslation.Translate("AUGUUUUGG"), Is.EquivalentTo(new[] { "Methionine", "Phenylalanine", "Tryptophan" }));
    }

    [Test]
    public void Stops_translation_if_stop_codon_present()
    {
        Assert.That(ProteinTranslation.Translate("AUGUUUUAA"), Is.EquivalentTo(new[] { "Methionine", "Phenylalanine" }));
    }

    [Test]
    public void Stops_translation_of_longer_strand()
    {
        Assert.That(ProteinTranslation.Translate("UGGUGUUAUUAAUGGUUU"), Is.EquivalentTo(new[] { "Tryptophan", "Cysteine", "Tyrosine" }));
    }

    [Test]
    public void Throws_for_invalid_codons()
    {
        Assert.That(() => ProteinTranslation.Translate("CARROT"), Throws.Exception);
    }
}
