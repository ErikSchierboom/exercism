module Series

open System

let slices (str:string) length = 
    if length < 1 || length > str.Length then
        None
    else
        str.ToCharArray()
        |> Seq.windowed length
        |> Seq.map String
        |> Seq.toList
        |> Some
