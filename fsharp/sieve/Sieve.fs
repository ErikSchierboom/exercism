module Sieve

let primes limit =
    let rec sieve candidates acc =     
        match candidates with
        | [] -> List.rev acc
        | prime::rest ->
            let multiples = [prime*prime..prime..limit]
            sieve (rest |> List.except multiples) (prime::acc)
    
    sieve [2 .. limit] []
