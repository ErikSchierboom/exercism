// This file was auto-generated based on version 1.1.0 of the canonical data.

module ScrabbleScoreTest

open FsUnit.Xunit
open Xunit

open ScrabbleScore

[<Fact>]
let ``Lowercase letter`` () =
    score "a" |> should equal 1

[<Fact>]
let ``Uppercase letter`` () =
    score "A" |> should equal 1

[<Fact>]
let ``Valuable letter`` () =
    score "f" |> should equal 4

[<Fact>]
let ``Short word`` () =
    score "at" |> should equal 2

[<Fact>]
let ``Short, valuable word`` () =
    score "zoo" |> should equal 12

[<Fact>]
let ``Medium word`` () =
    score "street" |> should equal 6

[<Fact>]
let ``Medium, valuable word`` () =
    score "quirky" |> should equal 22

[<Fact>]
let ``Long, mixed-case word`` () =
    score "OxyphenButazone" |> should equal 41

[<Fact>]
let ``English-like word`` () =
    score "pinata" |> should equal 8

[<Fact>]
let ``Empty input`` () =
    score "" |> should equal 0

[<Fact>]
let ``Entire alphabet available`` () =
    score "abcdefghijklmnopqrstuvwxyz" |> should equal 87

