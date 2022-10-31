module PerfectNumbers

type Classification =
    | Perfect
    | Abundant
    | Deficient

let private factors (n: int) =

    let rec inner acc nums =
        match nums with
        | [] -> acc
        | head :: tail ->
            if n % head = 0
            then inner ([ (n / head); head ] @ acc) tail
            else inner acc tail

    let sqrt = System.Math.Sqrt(n) |> int

    inner [ 1 ] [ 1 .. sqrt ]
    |> List.except (Seq.ofList [ n ])

let classify (n: int) : Classification option =

    if n < 1 then
        None
    else
        match n.CompareTo(factors n |> List.sum) with
        | -1 -> Some Abundant
        | 0 -> Some Perfect
        | 1 -> Some Deficient
        | _ -> failwith "NoNo"

