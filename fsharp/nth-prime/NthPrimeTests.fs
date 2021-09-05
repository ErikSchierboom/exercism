module NthPrimeTests

open FsUnit.Xunit
open Xunit

open NthPrime

[<Fact>]
let ``First prime`` () =
    prime 1 |> should equal (Some 2)

[<Fact>]
let ``Second prime`` () =
    prime 2 |> should equal (Some 3)

[<Fact>]
let ``Sixth prime`` () =
    prime 6 |> should equal (Some 13)

[<Fact>]
let ``Big prime`` () =
    prime 10001 |> should equal (Some 104743)

[<Fact>]
let ``There is no zeroth prime`` () =
    prime 0 |> should equal None

