module BracketPush

let private delimiterPairs = Map.ofList [('[', ']'); ('{', '}'); ('(', ')')]

let private isClosingDelimiter closeDelimiter =
    Map.exists (fun _ value -> value = closeDelimiter) delimiterPairs

let private isOpenDelimiter openDelimiter =
    Map.containsKey openDelimiter delimiterPairs
     
let isPaired (input: string) =        
    let rec loop unpaired unchecked =
        match unpaired, unchecked with
        | [], [] -> true
        | _,  [] -> false
        | _, y::ys when isOpenDelimiter y -> loop (y :: unpaired) ys
        | x::xs, y::ys when isClosingDelimiter y && Map.find x delimiterPairs = y -> loop xs ys
        | _, y::_ when isClosingDelimiter y -> false
        | _, _::ys -> loop unpaired ys
        
    loop [] (List.ofSeq input)
