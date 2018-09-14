module DifferenceOfSquares

let square x = x * x

let squareOfSums number = [1..number] |> List.sum |> square
let sumOfSquares number = [1..number] |> List.sumBy square
let difference number = squareOfSums number - sumOfSquares number