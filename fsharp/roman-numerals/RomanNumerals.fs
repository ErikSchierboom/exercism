module RomanNumerals

let rec private doRoman decimal numeral =
    match decimal with
    | _ when decimal >= 1000 -> doRoman (decimal - 1000) (numeral + "M") 
    | _ when decimal >=  900 -> doRoman (decimal -  900) (numeral + "CM") 
    | _ when decimal >=  500 -> doRoman (decimal -  500) (numeral + "D") 
    | _ when decimal >=  400 -> doRoman (decimal -  400) (numeral + "CD") 
    | _ when decimal >=  100 -> doRoman (decimal -  100) (numeral + "C")
    | _ when decimal >=   90 -> doRoman (decimal -   90) (numeral + "XC")
    | _ when decimal >=   50 -> doRoman (decimal -   50) (numeral + "L")
    | _ when decimal >=   40 -> doRoman (decimal -   40) (numeral + "XL")
    | _ when decimal >=   10 -> doRoman (decimal -   10) (numeral + "X")
    | _ when decimal >=    9 -> doRoman (decimal -    9) (numeral + "IX")
    | _ when decimal >=    5 -> doRoman (decimal -    5) (numeral + "V")
    | _ when decimal >=    4 -> doRoman (decimal -    4) (numeral + "IV")
    | _ when decimal >=    1 -> doRoman (decimal -    1) (numeral + "I")
    | _ -> numeral

let roman decimal = doRoman decimal ""
