module DifferenceOfSquares

type DifferenceOfSquares(number: int) =
    let square x = x * x

    member this.squareOfSums() = [1..number] |> List.sum |> square
    member this.sumOfSquares() = [1..number] |> List.map square |> List.sum
    member this.difference() = this.squareOfSums() - this.sumOfSquares()