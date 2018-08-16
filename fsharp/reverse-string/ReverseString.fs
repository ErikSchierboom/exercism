module ReverseString

let reverse (input: string): string = input |> Seq.rev |> Seq.toArray |> System.String