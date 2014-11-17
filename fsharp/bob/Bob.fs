module Bob

open System

type Bob(input: string) =
    let isEmpty = String.IsNullOrWhiteSpace input
    let isYell = Seq.exists Char.IsLetter input && input = input.ToUpperInvariant()
    let isQuestion = input.EndsWith "?"

    member this.hey() = match input with 
                        | x when isEmpty -> "Fine. Be that way!"
                        | x when isYell -> "Whoa, chill out!"
                        | x when isQuestion -> "Sure."
                        | _ -> "Whatever."

