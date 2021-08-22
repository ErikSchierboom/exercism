module PerfectNumbers

type Classification = Perfect | Abundant | Deficient 

let classify n =
    if n < 1 then
        None
    else
        let sumOfFactors = [for x in 1..n / 2 do if n % x = 0 then x] |> List.sum
        if sumOfFactors < n then Some Deficient
        elif sumOfFactors > n then Some Abundant
        else Some Perfect
