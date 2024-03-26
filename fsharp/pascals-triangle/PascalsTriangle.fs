module PascalsTriangle

let rows numberOfRows = 
    let scanner previous row =
        match row with
        | 1 -> [1]
        | _ -> 0 :: previous @ [0] |> List.pairwise |> List.map (fun (l,r) -> l+r) 
    
    [1 .. numberOfRows]
    |> List.scan scanner List.empty
    |> List.tail
