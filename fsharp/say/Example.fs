module Say

let quotRem (x: int64) (y: int64) =
    let div = x / y
    let rem = x % y
    (div, rem)

let bases n = 
    let values = 
        [| "one"
           "two";
           "three";
           "four";
           "five";
           "six";
           "seven";
           "eight";
           "nine";
           "ten";
           "eleven";
           "twelve";
           "thirteen";
           "fourteen";
           "fifteen";
           "sixteen";
           "seventeen";
           "eighteen";
           "nineteen" |]

    Array.tryItem (n - 1) values
                        
let tens n = 
    if n < 20 then 
        bases n
    else 
        let values = 
            [| "twenty"
               "thirty"
               "forty"
               "fifty"
               "sixty"
               "seventy"
               "eighty"
               "ninety" |]
        
        let (count, remainder) = quotRem (int64 n) 10L
        let countStr = Array.item ((int count) - 2) values
        let basesStr = Option.fold (fun acc item -> "-" + item) "" (bases (int remainder))
        Some (countStr + basesStr)

let hundreds n = 
    if n < 100L then 
        tens (int n)
    else 
        let (count, remainder) = quotRem (int64 n) 100L
        let tensStr = Option.fold (fun acc item -> " " + item) "" (tens (int remainder))
        Option.bind (fun item -> Some (item + " hundred" + tensStr)) (bases (int count))

let chunk str n = Option.bind (fun item -> Some (item + " " + str)) (hundreds n)
let thousands = chunk "thousand"
let millions = chunk "million"
let billions = chunk "billion"

let parts number = 
    let (billionsCount,  billionsRemainder)  = quotRem number            1000000000L
    let (millionsCount,  millionsRemainder)  = quotRem billionsRemainder 1000000L
    let (thousandsCount, thousandsRemainder) = quotRem millionsRemainder 1000L
    (billionsCount, millionsCount, thousandsCount, thousandsRemainder)
    
let inEnglish number = 
    match number with
    | _ when number < 0L || number>= 1000000000000L -> 
        None
    | 0L -> 
        Some "zero"
    | _ -> 
        let (billionsCount, millionsCount, thousandsCount, remainder) = parts number

        [ billions billionsCount; 
          millions millionsCount;
          thousands thousandsCount;
          hundreds remainder ]
        |> List.choose id
        |> List.reduce (fun x y -> x + " " + y)
        |> Some