module SayTests

open FsUnit.Xunit
open Xunit

open Say

[<Fact>]
let ``Zero`` () =
    say 0L |> should equal (Some "zero")

[<Fact>]
let ``One`` () =
    say 1L |> should equal (Some "one")

[<Fact>]
let ``Fourteen`` () =
    say 14L |> should equal (Some "fourteen")

[<Fact>]
let ``Twenty`` () =
    say 20L |> should equal (Some "twenty")

[<Fact>]
let ``Twenty-two`` () =
    say 22L |> should equal (Some "twenty-two")

[<Fact>]
let ``One hundred`` () =
    say 100L |> should equal (Some "one hundred")

[<Fact>]
let ``One hundred twenty-three`` () =
    say 123L |> should equal (Some "one hundred twenty-three")

[<Fact>]
let ``One thousand`` () =
    say 1000L |> should equal (Some "one thousand")

[<Fact>]
let ``One thousand two hundred thirty-four`` () =
    say 1234L |> should equal (Some "one thousand two hundred thirty-four")

[<Fact>]
let ``One million`` () =
    say 1000000L |> should equal (Some "one million")

[<Fact>]
let ``One million two thousand three hundred forty-five`` () =
    say 1002345L |> should equal (Some "one million two thousand three hundred forty-five")

[<Fact>]
let ``One billion`` () =
    say 1000000000L |> should equal (Some "one billion")

[<Fact>]
let ``A big number`` () =
    say 987654321123L |> should equal (Some "nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three")

[<Fact>]
let ``Numbers below zero are out of range`` () =
    say -1L |> should equal None

[<Fact>]
let ``Numbers above 999,999,999,999 are out of range`` () =
    say 1000000000000L |> should equal None

