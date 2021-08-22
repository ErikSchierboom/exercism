module Luhn

let private hasValidFormat (input: string) =
    let normalized = String.filter (System.Char.IsWhiteSpace >> not) input
    Seq.forall System.Char.IsDigit normalized && normalized.Length > 1

let private checksum (input: string) =
    let multipliers = Seq.init input.Length (fun i -> if (i + input.Length) % 2 = 0 then 2 else 1)
    
    String.filter System.Char.IsDigit input
    |> Seq.map System.Globalization.CharUnicodeInfo.GetDigitValue
    |> Seq.zip multipliers
    |> Seq.map (fun (n, m) -> n * m)
    |> Seq.sumBy (fun n -> if n > 9 then n - 9 else n)

let valid (input: string) = hasValidFormat input && checksum input % 10 = 0
