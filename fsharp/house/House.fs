module House

let private verse number =
    match number with
    | 1 -> "house that Jack built."
    | 2 -> "malt that lay in"
    | 3 -> "rat that ate"
    | 4 -> "cat that killed"
    | 5 -> "dog that worried"
    | 6 -> "cow with the crumpled horn that tossed"
    | 7 -> "maiden all forlorn that milked"
    | 8 -> "man all tattered and torn that kissed"
    | 9 -> "priest all shaven and shorn that married"
    | 10 -> "rooster that crowed in the morn that woke"
    | 11 -> "farmer sowing his corn that kept"
    | 12 -> "horse and the hound and the horn that belonged to"
    | _ -> failwith "Invalid verse"

let recite startVerse endVerse =
    [1..endVerse]
    |> List.scan (fun previous number -> verse number :: previous) []
    |> List.map (fun parts -> "This is" :: parts |> String.concat " the ")
    |> List.skip startVerse
