module RotationalCipher

let rotate n plaintext =
    let rotateMap n list = List.zip list (List.skip n list @ List.take n list)
    let letterMap = Seq.append (rotateMap n ['a'..'z']) (rotateMap n ['A'..'Z']) |> Map.ofSeq 

    plaintext
    |> Seq.map (fun letter -> Map.tryFind letter letterMap |> Option.defaultValue letter)
    |> Seq.toArray
    |> System.String
