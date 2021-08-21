module LargestSeriesProduct

open System

let largestProduct (input: string) span = 
    if span < 0 || span > input.Length || Seq.exists (Char.IsDigit >> not) input then
        None
    elif span = 0 then
        Some 1
    else 
        input
        |> Seq.map System.Globalization.CharUnicodeInfo.GetDigitValue
        |> Seq.windowed span
        |> Seq.map (Seq.reduce (*))
        |> Seq.max
        |> Some
