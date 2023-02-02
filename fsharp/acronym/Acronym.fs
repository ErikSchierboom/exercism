module Acronym

open System.Text.RegularExpressions

let abbreviate (phrase: string) =      
    Regex.Matches(phrase, "[A-Z]+[a-z]*|[a-z]+")
    |> Seq.map (fun m -> m.Value[0].ToString().ToUpper())
    |> String.concat ""