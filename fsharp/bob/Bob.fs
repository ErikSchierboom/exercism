module Bob

let private (|Empty|_|) (phrase: string) =
    if System.String.IsNullOrWhiteSpace phrase then Some () else None

let private (|Yell|_|) (phrase: string) =
    if phrase <> phrase.ToLower() && phrase = phrase.ToUpper() then Some () else None
    
let private (|Question|_|) (phrase: string) =
    if phrase.Trim().EndsWith "?" then Some () else None

let response (phrase: string): string =
    match phrase with
    | Empty -> "Fine. Be that way!"
    | Yell & Question -> "Calm down, I know what I'm doing!"
    | Yell -> "Whoa, chill out!"
    | Question -> "Sure."
    | _ -> "Whatever."
    