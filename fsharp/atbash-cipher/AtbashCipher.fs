module AtbashCipher

let private letters = ['a' .. 'z']

let private encodingMap = List.zip letters (List.rev letters) |> Map.ofList

let private encodeChar (c: char) = Map.tryFind c encodingMap |> Option.defaultValue c 

let encode (str:string) =
    str.ToLower()
    |> Seq.filter System.Char.IsLetterOrDigit
    |> Seq.chunkBySize 5
    |> Seq.map (fun chunk -> Seq.map encodeChar chunk |> Seq.toArray |> System.String)
    |> String.concat " "

let decode (str:string) = (encode str).Replace(" ", "")