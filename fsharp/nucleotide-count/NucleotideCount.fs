module NucleotideCount

let nucleotideCounts strand =
    let initial = Map.ofList [('A', 0); ('C', 0); ('G', 0); ('T', 0)]
    let counts = Seq.countBy id strand |> Seq.fold (fun counts (letter, count) -> Map.add letter count counts) initial
    if counts.Count = 4 then Some counts else None
