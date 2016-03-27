module RNATranscriptionTests

open NUnit.Framework
open Complement
    
[<Test>]
let ``Rna complement of cytosine is guanine`` () =
    Assert.That(toRna "C", Is.EqualTo("G"))

[<Test>]
let ``Rna complement of guanine is cytosine`` () =
    Assert.That(toRna "G", Is.EqualTo("C"))

[<Test>]
let ``Rna complement of thymine is adenine`` () =
    Assert.That(toRna "T", Is.EqualTo("A"))

[<Test>]
let ``Rna complement of adenine is uracil`` () =
    Assert.That(toRna "A", Is.EqualTo("U"))

[<Test>]
let ``Rna complement`` () =
    Assert.That(toRna "ACGTGGTCTTAA", Is.EqualTo("UGCACCAGAAUU"))

[<Test>]
let ``Dna complement of cytosine is guanine`` () =
    Assert.That(toDna "C", Is.EqualTo("G"))

[<Test>]
let ``Dna complement of guanine is cytosine`` () =
    Assert.That(toDna "G", Is.EqualTo("C"))

[<Test>]
let ``Dna complement of uracil is adenine`` () =
    Assert.That(toDna "U", Is.EqualTo("A"))

[<Test>]
let ``Dna complement of adenine is thymine`` () =
    Assert.That(toDna "A", Is.EqualTo("T"))

[<Test>]
let ``Dna complement`` () =
    Assert.That(toDna "UGAACCCGACAUG", Is.EqualTo("ACTTGGGCTGTAC"))
