module BinarySearch

let find (input: 'T array) value =
    let rec aux min max = 
        if min > max then
            None
        else
            let middle = (min + max) / 2            
            match input.[middle] with
            | x when x < value -> aux (middle + 1) max
            | x when x > value -> aux min (middle - 1)
            | _ -> Some middle
            
    aux 0 (input.Length - 1)