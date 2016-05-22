module ProteinTranslationTest

open NUnit.Framework

open ProteinTranslation

[<TestCase("AUG")>]
let ``Identifies Methionine codons`` (codon) =
    Assert.That(translate codon, Is.EqualTo(["Methionine"]))
    
[<TestCase("UUU")>]
[<TestCase("UUC")>]
let ``Identifies Phenylalanine codons`` (codon) =
    Assert.That(translate codon, Is.EqualTo(["Phenylalanine"]))
    
[<TestCase("UUA")>]
[<TestCase("UUG")>]
let ``Identifies Leucine codons`` (codon) =
    Assert.That(translate codon, Is.EqualTo(["Leucine"]))
    
[<TestCase("UCU")>]
[<TestCase("UCC")>]
[<TestCase("UCA")>]
[<TestCase("UCG")>]
let ``Identifies Serine codons`` (codon) =
    Assert.That(translate codon, Is.EqualTo(["Serine"]))
    
[<TestCase("UAU")>]
[<TestCase("UAC")>]
let ``Identifies Tyrosine codons`` (codon) =
    Assert.That(translate codon, Is.EqualTo(["Tyrosine"]))
    
[<TestCase("UGU")>]
[<TestCase("UGC")>]
let ``Identifies Cysteine codons`` (codon) =
    Assert.That(translate codon, Is.EqualTo(["Cysteine"]))
    
[<TestCase("UGG")>] 
let ``Identifies Tryptophan codons`` (codon) =
    Assert.That(translate codon, Is.EqualTo(["Tryptophan"]))

[<Test>]
let ``Translates rna strand into correct protein`` () =
    Assert.That(translate "AUGUUUUGG", Is.EqualTo(["Methionine"; "Phenylalanine"; "Tryptophan"]))

[<Test>]
let ``Stops translation if stop codon present`` () =
    Assert.That(translate "AUGUUUUAA", Is.EqualTo(["Methionine"; "Phenylalanine"]))

[<Test>]
let ``Stops translation of longer strand`` () =
    Assert.That(translate "UGGUGUUAUUAAUGGUUU'", Is.EqualTo(["Tryptophan"; "Cysteine"; "Tyrosine"]))

[<Test>]
let ``Throws for invalid codons`` () =
    Assert.That((fun () -> translate "CARROT'" |> ignore), Throws.Exception)