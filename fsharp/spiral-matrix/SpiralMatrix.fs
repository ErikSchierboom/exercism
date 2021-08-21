module SpiralMatrix
 
let rec private spiralValue size startValue row col =
    if row = 0 then startValue + col
    elif col = size - 1 then startValue + size + row - 1
    elif row = size - 1 then startValue + size * 3 - 3 - col
    elif col = 0 then startValue + size * 4 - 4 - row
    else spiralValue (size - 2) (startValue + size * 4 - 4) (row - 1) (col - 1)

let spiralMatrix size =
    [for row in 0..size - 1 do
        [for col in 0..size - 1 do spiralValue size 1 row col ] ]
 