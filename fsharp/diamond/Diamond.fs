module Diamond
let make (target: char) =
    let witeLine letterCount (line: int, letter: char) =
        let beforeAndAfter = "".PadRight(letterCount - line - 1)
        let middleLenght = if line = 0 then 0 else (line * 2 - 1)
        let middle = "".PadRight(middleLenght)
        if letter = 'A' then
            sprintf "%s%c%s" beforeAndAfter letter beforeAndAfter
        else
            sprintf "%s%c%s%c%s" beforeAndAfter letter middle letter beforeAndAfter
    
    let usedLetters = ['A'..target] |> List.mapi (fun x y -> (x,y))
    usedLetters
    |> List.rev |> List.tail
    |> List.append usedLetters
    |> List.map (fun (line, letter) -> witeLine usedLetters.Length (line, letter))
    |> List.reduce (fun x y -> sprintf "%s\n%s" x y)
