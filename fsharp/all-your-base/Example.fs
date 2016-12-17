module AllYourBase

open System

let swap (a, b) = b, a

let fromDigits fromBase digits = 
    let folder acc = 
        function
        | x when x < 0 || x >= fromBase || (x = 0 && acc = Some 0) -> None
        | x -> Option.map (fun y -> y * fromBase + x) acc

    match digits with
    | [] -> None
    | _  -> List.fold folder (Some 0) digits

let toDigits toBase n =
    let unfolder = 
        function
        | 0 -> None
        | x -> Some (Math.DivRem(x, toBase) |> swap)

    List.unfold unfolder n |> List.rev

let rebase inputBase inputDigits outputBase =
    if inputBase < 2 || outputBase < 2 then 
        None
    else 
        inputDigits 
        |> fromDigits inputBase 
        |> Option.map (toDigits outputBase)