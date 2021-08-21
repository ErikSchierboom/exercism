module Diamond

let make letter =
    let makeLine letterCount (row, letter) = 
        let outerSpaces  = "".PadRight(letterCount - row - 1)
        let innerSpaces = "".PadRight(if row = 0 then 0 else row * 2 - 1)

        if letter = 'A' then $"{outerSpaces}{letter}{outerSpaces}"
        else $"{outerSpaces}{letter}{innerSpaces}{letter}{outerSpaces}"
    
    let letters = ['A'..letter] |> List.mapi (fun x y -> x, y)

    letters @ (List.rev letters |> List.tail)
    |> Seq.map (makeLine letters.Length)
    |> String.concat "\n"
