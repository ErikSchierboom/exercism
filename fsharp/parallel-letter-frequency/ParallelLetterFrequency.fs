module ParallelLetterFrequency

open System

module Map =
    let merge = Map.fold (fun acc key value -> Map.add key ((Map.tryFind key acc |> Option.defaultValue 0) + value) acc)

let private asyncTextFrequency text = async {
    return
        text
        |> Seq.filter Char.IsLetter
        |> Seq.countBy Char.ToLower
        |> Map.ofSeq
}

let frequency texts = 
    texts
    |> Seq.map asyncTextFrequency   
    |> Async.Parallel
    |> Async.RunSynchronously 
    |> Seq.fold Map.merge Map.empty
