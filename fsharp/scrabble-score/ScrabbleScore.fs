module ScrabbleScore

let private lettersToScore = 
    [("AEIOULNRST", 1); ("DG", 2); ("BCMP", 3); ("FHVWY", 4); ("K", 5); ("JX", 8); ("QZ", 10)] 
    |> Seq.collect (fun (letters, score) -> Seq.map (fun letter -> letter, score) letters)
    |> Map.ofSeq

let scoreLetter letter = Map.tryFind letter lettersToScore |> Option.defaultValue 0

let score (word:string) = Seq.sumBy scoreLetter (word.ToUpperInvariant()) 
