﻿module RNATranscriptionTests

open NUnit.Framework

open RNATranscription
    
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