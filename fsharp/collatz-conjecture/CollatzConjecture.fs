module CollatzConjecture

let steps number =
    let unfolder current =
        if current = 1 then None
        elif current % 2 = 0 then Some (current, current / 2)
        else Some (current, current * 3 + 1)

    if number < 1 then None
    else Seq.unfold unfolder number |> Seq.length |> Some
