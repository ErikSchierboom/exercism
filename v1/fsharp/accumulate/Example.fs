module Accumulate

let accumulate func input = 
    let rec aux acc =
        function
        | []    -> acc
        | x::xs -> aux (func x :: acc) xs
    
    aux [] input |> List.rev