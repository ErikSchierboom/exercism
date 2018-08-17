module TwoFer

let twoFer (input: string option): string = 
    input
    |> Option.defaultValue "you"
    |> sprintf "One for %s, one for me."