module CollatzConjecture

let steps number = 
    let rec doSteps count current =
        if current < 1 then None
        elif current = 1 then Some count
        elif current % 2 = 0 then doSteps (count + 1) (current / 2)
        else doSteps (count + 1) (current * 3  + 1)

    doSteps 0 number
