module SumOfMultiples

let sum numbers upperBound =
    let isMultiple x = numbers |> Seq.exists (fun y -> x % y = 0) 
    
    [1 .. upperBound - 1] 
    |> Seq.filter isMultiple 
    |> Seq.sum