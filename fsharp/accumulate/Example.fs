module Accumulate

let rec accumulateLoop func acc = 
    function
    | []    -> acc |> List.rev
    | x::xs -> accumulateLoop func (func x :: acc) xs

let accumulate func input = accumulateLoop func [] input