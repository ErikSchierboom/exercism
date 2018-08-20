module ReverseString

open System

let reverse input = input |> Seq.rev |> Seq.toArray |> String