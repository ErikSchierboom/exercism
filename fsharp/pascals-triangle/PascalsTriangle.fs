module PascalsTriangle
    
let rows size =
    let row i = List.scan (fun acc j -> acc * (i - j) / j) 1 [1 .. i - 1]
    if size < 0 then None else Some (List.map row [1..size])
