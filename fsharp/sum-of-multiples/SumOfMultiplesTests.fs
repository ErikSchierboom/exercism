module SumOfMultiplesTests

open FsUnit.Xunit
open Xunit

open SumOfMultiples

[<Fact>]
let ``No multiples within limit`` () =
    sum [3; 5] 1 |> should equal 0

[<Fact>]
let ``One factor has multiples within limit`` () =
    sum [3; 5] 4 |> should equal 3

[<Fact>]
let ``More than one multiple within limit`` () =
    sum [3] 7 |> should equal 9

[<Fact>]
let ``More than one factor with multiples within limit`` () =
    sum [3; 5] 10 |> should equal 23

[<Fact>]
let ``Each multiple is only counted once`` () =
    sum [3; 5] 100 |> should equal 2318

[<Fact>]
let ``A much larger limit`` () =
    sum [3; 5] 1000 |> should equal 233168

[<Fact>]
let ``Three factors`` () =
    sum [7; 13; 17] 20 |> should equal 51

[<Fact>]
let ``Factors not relatively prime`` () =
    sum [4; 6] 15 |> should equal 30

[<Fact>]
let ``Some pairs of factors relatively prime and some not`` () =
    sum [5; 6; 8] 150 |> should equal 4419

[<Fact>]
let ``One factor is a multiple of another`` () =
    sum [5; 25] 51 |> should equal 275

[<Fact>]
let ``Much larger factors`` () =
    sum [43; 47] 10000 |> should equal 2203160

[<Fact>]
let ``All numbers are multiples of 1`` () =
    sum [1] 100 |> should equal 4950

[<Fact>]
let ``No factors means an empty sum`` () =
    sum [] 10000 |> should equal 0

[<Fact>]
let ``The only multiple of 0 is 0`` () =
    sum [0] 1 |> should equal 0

[<Fact>]
let ``The factor 0 does not affect the sum of multiples of other factors`` () =
    sum [3; 0] 4 |> should equal 3

[<Fact>]
let ``Solutions using include-exclude must extend to cardinality greater than 3`` () =
    sum [2; 3; 5; 7; 11] 10000 |> should equal 39614537

