// This file was auto-generated based on version 1.3.0 of the canonical data.

module AcronymTest

open FsUnit.Xunit
open Xunit

open Acronym

[<Fact>]
let ``Basic`` () =
    abbreviate "Portable Network Graphics" |> should equal "PNG"

[<Fact>]
let ``Lowercase words`` () =
    abbreviate "Ruby on Rails" |> should equal "ROR"

[<Fact>]
let ``Punctuation`` () =
    abbreviate "First In, First Out" |> should equal "FIFO"

[<Fact>]
let ``All caps word`` () =
    abbreviate "GNU Image Manipulation Program" |> should equal "GIMP"

[<Fact>]
let ``Punctuation without whitespace`` () =
    abbreviate "Complementary metal-oxide semiconductor" |> should equal "CMOS"

