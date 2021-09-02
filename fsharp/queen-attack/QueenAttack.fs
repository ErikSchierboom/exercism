module QueenAttack

let create (row, col) = row >= 0 && row < 8 && col >= 0 && col < 8

let canAttack (row1, col1) (row2, col2) =
    let abs (x:int) = System.Math.Abs x
    if row1 = row2 && col1 = col2 then false
    else row1 = row2 || col1 = col2 || (row1 - row2 |> abs) = (col1 - col2 |> abs)