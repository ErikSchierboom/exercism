module DifferenceOfSquares

let square n = n * n

let squareOfSum n = List.sum [1..n] |> square 

let sumOfSquares n = List.sumBy square [1..n]

let differenceOfSquares n = squareOfSum n - sumOfSquares n 
