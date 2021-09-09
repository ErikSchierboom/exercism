module ArmstrongNumbersTests

open FsUnit.Xunit
open Xunit

open ArmstrongNumbers

[<Fact>]
let ``Zero is an Armstrong number`` () =
    isArmstrongNumber 0 |> should equal true

[<Fact>]
let ``Single digit numbers are Armstrong numbers`` () =
    isArmstrongNumber 5 |> should equal true

[<Fact>]
let ``There are no 2 digit Armstrong numbers`` () =
    isArmstrongNumber 10 |> should equal false

[<Fact>]
let ``Three digit number that is an Armstrong number`` () =
    isArmstrongNumber 153 |> should equal true

[<Fact>]
let ``Three digit number that is not an Armstrong number`` () =
    isArmstrongNumber 100 |> should equal false

[<Fact>]
let ``Four digit number that is an Armstrong number`` () =
    isArmstrongNumber 9474 |> should equal true

[<Fact>]
let ``Four digit number that is not an Armstrong number`` () =
    isArmstrongNumber 9475 |> should equal false

[<Fact>]
let ``Seven digit number that is an Armstrong number`` () =
    isArmstrongNumber 9926315 |> should equal true

[<Fact>]
let ``Seven digit number that is not an Armstrong number`` () =
    isArmstrongNumber 9926314 |> should equal false

