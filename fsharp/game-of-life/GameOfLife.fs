module GameOfLife

let tick (input: int[,]) =
    let deltas = [-1; 0; 1]
    let dimension = input.GetLength(0)
    
    let numberOfLiveNeighbors x y =
        seq {
            for dx in deltas do
                for dy in deltas do
                    if dx <> 0 || dy <> 0 then
                       let neighborX, neighborY = x + dx, y + dy
                       if neighborX >= 0 && neighborX < dimension &&
                          neighborY >= 0 && neighborY < dimension &&
                          input.[neighborX, neighborY] = 1 then
                            yield true
        } |> Seq.length
    
    Array2D.mapi (fun x y cell ->
        match cell, numberOfLiveNeighbors x y with
        | 1, 2 | 1, 3 | 0, 3 -> 1
        | _ -> 0
    ) input