module RomanNumerals

let private decimalToNumeral =
    [(1000, "M")
     ( 900, "CM")
     ( 500, "D")
     ( 400, "CD")
     ( 100, "C")
     (  90, "XC")
     (  50, "L")
     (  40, "XL")
     (  10, "X")
     (   9, "IX")
     (   5, "V")
     (   4, "IV")
     (   1, "I")]

let roman n =
    let rec inner acc remainder thresholds =         
        match thresholds with
        | [] ->
            acc
        | (threshold, numeral)::_ when threshold <= remainder ->
            inner (acc + numeral) (remainder - threshold) thresholds
        | _::xs->
            inner acc remainder xs
    
    inner "" n decimalToNumeral