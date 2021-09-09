module WordCount

let countWords (phrase: string) = 
    System.Text.RegularExpressions.Regex.Matches(phrase.ToLowerInvariant(), @"\w+('\w+)*")
    |> Seq.countBy (fun m -> m.Value)
    |> Map.ofSeq