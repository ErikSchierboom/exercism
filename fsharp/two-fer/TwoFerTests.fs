module TwoFerTests

open FsUnit.Xunit
open Xunit

open TwoFer

[<Fact>]
let ``No name given`` () =
    twoFer None |> should equal "One for you, one for me."

[<Fact>]
let ``A name given`` () =
    twoFer (Some "Alice") |> should equal "One for Alice, one for me."

[<Fact>]
let ``Another name given`` () =
    twoFer (Some "Bob") |> should equal "One for Bob, one for me."

