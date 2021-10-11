module GuessingGame

let reply guess =
    match guess with
    | 42 -> "Correct"
    | 41 | 43 -> "So close"
    | _ when guess < 41 -> "Too low"
    | _ -> "Too high"
