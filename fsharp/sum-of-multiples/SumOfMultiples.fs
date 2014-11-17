module SumOfMultiples

type SumOfMultiples(numbers: int list) =
    let isMultiple x = numbers |> List.exists (fun y -> x % y = 0)

    new() = SumOfMultiples([3; 5])    

    member this.To(n) = [1 .. n - 1] |> List.filter isMultiple |> List.sum