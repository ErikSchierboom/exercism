module BracketPush

open System

let bracketPairs = [('[', ']'); ('{', '}'); ('(', ')')]

let findBracketPair character =
    let isMatch = fun (open', close') -> open' = character || close' = character
    List.tryFind isMatch bracketPairs
     
let matched (input: string) =        
    let rec loop stack =
        function
        | [] -> 
            List.isEmpty stack
        | x::xs ->
            match findBracketPair x with
            | Some (opening, _) when x = opening ->
                loop (x::stack) xs
            | Some (opening, closing) when x = closing ->
                match stack with
                | [] -> 
                    false
                | y::ys when y = opening ->
                    loop ys xs
                | _ -> 
                    false
            | _ -> 
                loop stack xs
        
    loop [] (List.ofSeq input)
