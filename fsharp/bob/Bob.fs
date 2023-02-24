module Bob

let private (|Silence|_|) (phrase: string): unit option =
    if System.String.IsNullOrWhiteSpace phrase then Some () else None

let private (|Yell|_|) (phrase: string): unit option =
    if phrase <> phrase.ToLower() && phrase = phrase.ToUpper() then Some () else None
    
let private (|Question|_|) (phrase: string): unit option =
    if phrase.Trim().EndsWith "?" then Some () else None

let response (phrase: string): string =
    match phrase with
    | Silence         -> "Fine. Be that way!"
    | Yell & Question -> "Calm down, I know what I'm doing!"
    | Yell            -> "Whoa, chill out!"
    | Question        -> "Sure."
    | _               -> "Whatever."
    