module Series

open System

let slices (str:string) length = 
    if length < 1 || length > str.Length then
        None
    else
        str.ToCharArray()
        |> Array.windowed length
        |> Array.map String
        |> Array.toList
        |> Some