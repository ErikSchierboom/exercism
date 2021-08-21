module KindergartenGarden

type Plant = Violets | Radishes | Clover | Grass

let private students = ["Alice"; "Bob"; "Charlie"; "David"; "Eve"; "Fred"; "Ginny"; "Harriet"; "Ileana"; "Joseph"; "Kincaid"; "Larry"]

let private plantFromCode code =
    match code with
    | 'V' -> Plant.Violets
    | 'R' -> Plant.Radishes
    | 'C' -> Plant.Clover
    | 'G' -> Plant.Grass
    | x -> failwithf $"{x} is an invalid plant code"

let plants (windowSills: string) student =
    windowSills.Split()
    |> Array.map (Seq.map plantFromCode)
    |> fun rows -> Seq.zip (Seq.chunkBySize 2 rows.[0]) (Seq.chunkBySize 2 rows.[1])
    |> Seq.map (fun (left, right) -> Seq.append left right |> Seq.toList)
    |> Seq.zip students
    |> Map.ofSeq
    |> Map.find student
