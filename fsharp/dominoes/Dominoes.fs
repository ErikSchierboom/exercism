module Dominoes

let private rotations (xs: 'T list) =
    Seq.init xs.Length (fun shift -> List.permute (fun i -> (i + shift) % xs.Length) xs)

let private tryChain (x, y) list =
    match list with
    | (x', y') :: xs when y = x' -> (x, y') :: xs |> Some
    | (x', y') :: xs when y = y' -> (x, x') :: xs |> Some
    | _ -> None

let rec canChain input =
    match input with
    | [] -> true
    | [ (x, y) ] -> x = y
    | x :: xs -> rotations xs |> Seq.choose (tryChain x) |> Seq.exists canChain
