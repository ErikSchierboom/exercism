module Bob

let response (phrase: string) = 
    let isEmpty = System.String.IsNullOrWhiteSpace phrase
    let isYell = Seq.exists System.Char.IsLetter phrase && phrase = phrase.ToUpperInvariant()
    let isQuestion = phrase.Trim().EndsWith "?"

    match phrase with 
    | _ when isEmpty -> "Fine. Be that way!"
    | _ when isYell && isQuestion -> "Calm down, I know what I'm doing!"
    | _ when isYell ->  "Whoa, chill out!"
    | _ when isQuestion -> "Sure."
    | _ -> "Whatever."