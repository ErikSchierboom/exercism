module BinarySearch

let binarySearch input value =
    let rec aux min max = 
        if min > max then
            None
        else
            let middle = (min + max) / 2            
            match Array.item middle input with
            | x when x < value -> aux (middle + 1) max
            | x when x > value -> aux min (middle - 1)
            | _ -> Some middle
            
    aux 0 (Array.length input - 1)