module RunLengthEncoding

open System
open System.Text.RegularExpressions

let encode (input: string) =
    Regex("(.)\\1*").Matches(input)
    |> Seq.map (fun m -> m.Value.[0], m.Value.Length)
    |> Seq.map (fun (letter, count) -> if count = 1 then $"{letter}" else $"{count}{letter}")
    |> String.concat ""

let decode (input: string) =
    Regex("(\\d*)(.)").Matches(input)
    |> Seq.map (fun m -> m.Groups.[2].Value.[0], if m.Groups.[1].Length = 0 then 1 else int m.Groups.[1].Value)
    |> Seq.map String
    |> String.concat ""
