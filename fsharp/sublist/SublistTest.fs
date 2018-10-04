// This file was auto-generated based on version 1.1.0 of the canonical data.

module SublistTest

open FsUnit.Xunit
open Xunit

open Sublist

[<Fact>]
let ``Empty lists`` () =
    let listOne = []
    let listTwo = []
    sublist listOne listTwo |> should equal SublistType.Equal

[<Fact>]
let ``Empty list within non empty list`` () =
    let listOne = []
    let listTwo = [1; 2; 3]
    sublist listOne listTwo |> should equal SublistType.Sublist

[<Fact>]
let ``Non empty list contains empty list`` () =
    let listOne = [1; 2; 3]
    let listTwo = []
    sublist listOne listTwo |> should equal SublistType.Superlist

[<Fact>]
let ``List equals itself`` () =
    let listOne = [1; 2; 3]
    let listTwo = [1; 2; 3]
    sublist listOne listTwo |> should equal SublistType.Equal

[<Fact>]
let ``Different lists`` () =
    let listOne = [1; 2; 3]
    let listTwo = [2; 3; 4]
    sublist listOne listTwo |> should equal SublistType.Unequal

[<Fact>]
let ``False start`` () =
    let listOne = [1; 2; 5]
    let listTwo = [0; 1; 2; 3; 1; 2; 5; 6]
    sublist listOne listTwo |> should equal SublistType.Sublist

[<Fact>]
let ``Consecutive`` () =
    let listOne = [1; 1; 2]
    let listTwo = [0; 1; 1; 1; 2; 1; 2]
    sublist listOne listTwo |> should equal SublistType.Sublist

[<Fact>]
let ``Sublist at start`` () =
    let listOne = [0; 1; 2]
    let listTwo = [0; 1; 2; 3; 4; 5]
    sublist listOne listTwo |> should equal SublistType.Sublist

[<Fact>]
let ``Sublist in middle`` () =
    let listOne = [2; 3; 4]
    let listTwo = [0; 1; 2; 3; 4; 5]
    sublist listOne listTwo |> should equal SublistType.Sublist

[<Fact>]
let ``Sublist at end`` () =
    let listOne = [3; 4; 5]
    let listTwo = [0; 1; 2; 3; 4; 5]
    sublist listOne listTwo |> should equal SublistType.Sublist

[<Fact>]
let ``At start of superlist`` () =
    let listOne = [0; 1; 2; 3; 4; 5]
    let listTwo = [0; 1; 2]
    sublist listOne listTwo |> should equal SublistType.Superlist

[<Fact>]
let ``In middle of superlist`` () =
    let listOne = [0; 1; 2; 3; 4; 5]
    let listTwo = [2; 3]
    sublist listOne listTwo |> should equal SublistType.Superlist

[<Fact>]
let ``At end of superlist`` () =
    let listOne = [0; 1; 2; 3; 4; 5]
    let listTwo = [3; 4; 5]
    sublist listOne listTwo |> should equal SublistType.Superlist

[<Fact>]
let ``First list missing element from second list`` () =
    let listOne = [1; 3]
    let listTwo = [1; 2; 3]
    sublist listOne listTwo |> should equal SublistType.Unequal

[<Fact>]
let ``Second list missing element from first list`` () =
    let listOne = [1; 2; 3]
    let listTwo = [1; 3]
    sublist listOne listTwo |> should equal SublistType.Unequal

[<Fact>]
let ``Order matters to a list`` () =
    let listOne = [1; 2; 3]
    let listTwo = [3; 2; 1]
    sublist listOne listTwo |> should equal SublistType.Unequal

[<Fact>]
let ``Same digits but different numbers`` () =
    let listOne = [1; 0; 1]
    let listTwo = [10; 1]
    sublist listOne listTwo |> should equal SublistType.Unequal

