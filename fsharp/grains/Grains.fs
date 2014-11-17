module Grains

open System.Numerics

type Grains() =

    member this.square (n:int) = 2I ** (n - 1)
    member this.total() = [1..64] |> List.sumBy (this.square)