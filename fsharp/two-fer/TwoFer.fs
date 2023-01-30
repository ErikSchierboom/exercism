module TwoFer

let twoFer input =
    let name = Option.defaultValue "you" input
    $"One for {name}, one for me."
