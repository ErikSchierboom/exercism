module CollatzConjecture

let rec private stepsHelper steps number =
    match number with
    | 1 -> Some steps
    | _ when number < 1 -> None
    | _ when number % 2 = 0 -> stepsHelper (steps + 1) (number / 2)
    | _ -> stepsHelper (steps + 1) (number * 3  + 1)

let steps number = stepsHelper 0 number