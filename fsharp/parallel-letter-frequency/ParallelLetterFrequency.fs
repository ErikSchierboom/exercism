module ParallelLetterFrequency

open System

module Map =
    let merge x y = 
        let folder acc key value =
            match Map.tryFind key acc with
            | Some z -> Map.add key (z + value) acc
            | None -> Map.add key value acc
        Map.fold folder x y

let private asyncCalculateFrequency text = async {
    return
        text
        |> Seq.filter Char.IsLetter
        |> Seq.countBy Char.ToLower
        |> Map.ofSeq
}

let frequency texts = 
    texts
    |> Seq.map asyncCalculateFrequency   
    |> Async.Parallel
    |> Async.RunSynchronously 
    |> Seq.fold Map.merge Map.empty