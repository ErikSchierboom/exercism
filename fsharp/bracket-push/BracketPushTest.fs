// This file was auto-generated based on version 1.3.0 of the canonical data.

module BracketPushTest

open FsUnit.Xunit
open Xunit

open BracketPush

[<Fact>]
let ``Paired square brackets`` () =
    isPaired "[]" |> should equal true

[<Fact>]
let ``Empty string`` () =
    isPaired "" |> should equal true

[<Fact>]
let ``Unpaired brackets`` () =
    isPaired "[[" |> should equal false

[<Fact>]
let ``Wrong ordered brackets`` () =
    isPaired "}{" |> should equal false

[<Fact>]
let ``Wrong closing bracket`` () =
    isPaired "{]" |> should equal false

[<Fact>]
let ``Paired with whitespace`` () =
    isPaired "{ }" |> should equal true

[<Fact>]
let ``Partially paired brackets`` () =
    isPaired "{[])" |> should equal false

[<Fact>]
let ``Simple nested brackets`` () =
    isPaired "{[]}" |> should equal true

[<Fact>]
let ``Several paired brackets`` () =
    isPaired "{}[]" |> should equal true

[<Fact>]
let ``Paired and nested brackets`` () =
    isPaired "([{}({}[])])" |> should equal true

[<Fact>]
let ``Unopened closing brackets`` () =
    isPaired "{[)][]}" |> should equal false

[<Fact>]
let ``Unpaired and nested brackets`` () =
    isPaired "([{])" |> should equal false

[<Fact>]
let ``Paired and wrong nested brackets`` () =
    isPaired "[({]})" |> should equal false

[<Fact>]
let ``Math expression`` () =
    isPaired "(((185 + 223.85) * 15) - 543)/2" |> should equal true

[<Fact>]
let ``Complex latex expression`` () =
    isPaired "\left(\begin{array}{cc} \frac{1}{3} & x\\ \mathrm{e}^{x} &... x^2 \end{array}\right)" |> should equal true

