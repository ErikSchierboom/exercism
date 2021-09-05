module BookStoreTests

open FsUnit.Xunit
open Xunit

open BookStore

[<Fact>]
let ``Only a single book`` () =
    total [1] |> should equal 8.00m

[<Fact>]
let ``Two of the same book`` () =
    total [2; 2] |> should equal 16.00m

[<Fact>]
let ``Empty basket`` () =
    total [] |> should equal 0.00m

[<Fact>]
let ``Two different books`` () =
    total [1; 2] |> should equal 15.20m

[<Fact>]
let ``Three different books`` () =
    total [1; 2; 3] |> should equal 21.60m

[<Fact>]
let ``Four different books`` () =
    total [1; 2; 3; 4] |> should equal 25.60m

[<Fact>]
let ``Five different books`` () =
    total [1; 2; 3; 4; 5] |> should equal 30.00m

[<Fact>]
let ``Two groups of four is cheaper than group of five plus group of three`` () =
    total [1; 1; 2; 2; 3; 3; 4; 5] |> should equal 51.20m

[<Fact>]
let ``Two groups of four is cheaper than groups of five and three`` () =
    total [1; 1; 2; 3; 4; 4; 5; 5] |> should equal 51.20m

[<Fact>]
let ``Group of four plus group of two is cheaper than two groups of three`` () =
    total [1; 1; 2; 2; 3; 4] |> should equal 40.80m

[<Fact>]
let ``Two each of first 4 books and 1 copy each of rest`` () =
    total [1; 1; 2; 2; 3; 3; 4; 4; 5] |> should equal 55.60m

[<Fact>]
let ``Two copies of each book`` () =
    total [1; 1; 2; 2; 3; 3; 4; 4; 5; 5] |> should equal 60.00m

[<Fact>]
let ``Three copies of first book and 2 each of remaining`` () =
    total [1; 1; 2; 2; 3; 3; 4; 4; 5; 5; 1] |> should equal 68.00m

[<Fact>]
let ``Three each of first 2 books and 2 each of remaining books`` () =
    total [1; 1; 2; 2; 3; 3; 4; 4; 5; 5; 1; 2] |> should equal 75.20m

[<Fact>]
let ``Four groups of four are cheaper than two groups each of five and three`` () =
    total [1; 1; 2; 2; 3; 3; 4; 5; 1; 1; 2; 2; 3; 3; 4; 5] |> should equal 102.40m

