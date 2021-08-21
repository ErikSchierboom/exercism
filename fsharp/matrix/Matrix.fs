module Matrix

let private rows (matrix: string) =
    matrix.Split('\n') |> Seq.map (fun row -> row.Split() |> Seq.map int |> Seq.toList)

let row index matrix = rows matrix |> Seq.item index

let column index matrix = rows matrix |> List.transpose |> Seq.item index
