// This file was auto-generated based on version 1.1.0 of the canonical data.

module ReverseStringTest

open FsUnit.Xunit
open Xunit

open ReverseString

[<Fact>]
let ``An empty string`` () =
    reverse "" |> should equal ""

[<Fact>]
let ``A word`` () =
    reverse "robot" |> should equal "tobor"

[<Fact>]
let ``A capitalized word`` () =
    reverse "Ramen" |> should equal "nemaR"

[<Fact>]
let ``A sentence with punctuation`` () =
    reverse "I'm hungry!" |> should equal "!yrgnuh m'I"

[<Fact>]
let ``A palindrome`` () =
    reverse "racecar" |> should equal "racecar"

