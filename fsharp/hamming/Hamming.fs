module Hamming

let distance (strand1: string) (strand2: string) = 
    if strand1.Length <> strand2.Length then
        None
    else    
        Seq.zip strand1 strand2
        |> Seq.filter (fun (n1, n2) -> n1 <> n2)
        |> Seq.length
        |> Some
