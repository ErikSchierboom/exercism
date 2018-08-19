module CollatzConjecture

let rec private stepsHelper count current =
    match current with
    | 1 -> count
    | _ when current % 2 = 0 -> stepsHelper (count + 1) (current / 2)
    | _ -> stepsHelper (count + 1) (current * 3  + 1)

let steps number =
    if number < 1 then
        None
    else
        Some (stepsHelper 0 number)