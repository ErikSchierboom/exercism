module AtbashCipher

let private letters = ['a' .. 'z']

let private encodingMap = Seq.zip letters (Seq.rev letters) |> Map.ofSeq

let private encodeChar c = Map.tryFind c encodingMap |> Option.defaultValue c 

let encode (str:string) =
    str.ToLower()
    |> Seq.filter System.Char.IsLetterOrDigit
    |> Seq.chunkBySize 5
    |> Seq.map (Array.map encodeChar >> System.String)
    |> String.concat " "

let decode (str:string) = encode str |> String.filter System.Char.IsLetterOrDigit
