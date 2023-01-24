module ProteinTranslationTests

open FsUnit.Xunit
open Xunit

open ProteinTranslation

[<Fact>]
let ``Empty RNA sequence results in no proteins`` () =
    proteins "" |> should be Empty

[<Fact>]
let ``Methionine RNA sequence`` () =
    proteins "AUG" |> should equal ["Methionine"]

[<Fact>]
let ``Phenylalanine RNA sequence 1`` () =
    proteins "UUU" |> should equal ["Phenylalanine"]

[<Fact>]
let ``Phenylalanine RNA sequence 2`` () =
    proteins "UUC" |> should equal ["Phenylalanine"]

[<Fact>]
let ``Leucine RNA sequence 1`` () =
    proteins "UUA" |> should equal ["Leucine"]

[<Fact>]
let ``Leucine RNA sequence 2`` () =
    proteins "UUG" |> should equal ["Leucine"]

[<Fact>]
let ``Serine RNA sequence 1`` () =
    proteins "UCU" |> should equal ["Serine"]

[<Fact>]
let ``Serine RNA sequence 2`` () =
    proteins "UCC" |> should equal ["Serine"]

[<Fact>]
let ``Serine RNA sequence 3`` () =
    proteins "UCA" |> should equal ["Serine"]

[<Fact>]
let ``Serine RNA sequence 4`` () =
    proteins "UCG" |> should equal ["Serine"]

[<Fact>]
let ``Tyrosine RNA sequence 1`` () =
    proteins "UAU" |> should equal ["Tyrosine"]

[<Fact>]
let ``Tyrosine RNA sequence 2`` () =
    proteins "UAC" |> should equal ["Tyrosine"]

[<Fact>]
let ``Cysteine RNA sequence 1`` () =
    proteins "UGU" |> should equal ["Cysteine"]

[<Fact>]
let ``Cysteine RNA sequence 2`` () =
    proteins "UGC" |> should equal ["Cysteine"]

[<Fact>]
let ``Tryptophan RNA sequence`` () =
    proteins "UGG" |> should equal ["Tryptophan"]

[<Fact>]
let ``STOP codon RNA sequence 1`` () =
    proteins "UAA" |> should be Empty

[<Fact>]
let ``STOP codon RNA sequence 2`` () =
    proteins "UAG" |> should be Empty

[<Fact>]
let ``STOP codon RNA sequence 3`` () =
    proteins "UGA" |> should be Empty

[<Fact>]
let ``Sequence of two protein codons translates into proteins`` () =
    proteins "UUUUUU" |> should equal ["Phenylalanine"; "Phenylalanine"]

[<Fact>]
let ``Sequence of two different protein codons translates into proteins`` () =
    proteins "UUAUUG" |> should equal ["Leucine"; "Leucine"]

[<Fact>]
let ``Translate RNA strand into correct protein list`` () =
    proteins "AUGUUUUGG" |> should equal ["Methionine"; "Phenylalanine"; "Tryptophan"]

[<Fact>]
let ``Translation stops if STOP codon at beginning of sequence`` () =
    proteins "UAGUGG" |> should be Empty

[<Fact>]
let ``Translation stops if STOP codon at end of two-codon sequence`` () =
    proteins "UGGUAG" |> should equal ["Tryptophan"]

[<Fact>]
let ``Translation stops if STOP codon at end of three-codon sequence`` () =
    proteins "AUGUUUUAA" |> should equal ["Methionine"; "Phenylalanine"]

[<Fact>]
let ``Translation stops if STOP codon in middle of three-codon sequence`` () =
    proteins "UGGUAGUGG" |> should equal ["Tryptophan"]

[<Fact>]
let ``Translation stops if STOP codon in middle of six-codon sequence`` () =
    proteins "UGGUGUUAUUAAUGGUUU" |> should equal ["Tryptophan"; "Cysteine"; "Tyrosine"]

