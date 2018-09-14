module PascalsTriangle
    
let rows count = 
    let row i = 
        [1 .. i - 1] 
        |> List.scan (fun acc j -> acc * (i - j) / j) 1 
   
    [1..count] 
    |> List.map row