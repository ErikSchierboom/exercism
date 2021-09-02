module Proverb

let private line (want, lost) = $"For want of a %s{want} the %s{lost} was lost."

let private ending input = $"And all for the want of a %s{List.head input}."

let recite input =
    if List.isEmpty input then
        []
    else
        List.append (List.pairwise input |> List.map line) [ending input]
    