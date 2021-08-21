module Change

let private calculateFewestCoins coins map target =
    coins
    |> Seq.filter (fun coin -> coin <= target) 
    |> Seq.choose (fun coin -> Map.tryFind (target - coin) map |> Option.map (fun change -> coin :: change))
    |> Seq.sortBy List.length
    |> Seq.tryHead 

let private updateFewestCoinsMap coins fewestCoinsMap amount = 
    match calculateFewestCoins coins fewestCoinsMap amount with
    | Some fewestCoins -> Map.add amount fewestCoins fewestCoinsMap
    | None -> fewestCoinsMap

let findFewestCoins coins amount = 
    [1..amount]
    |> Seq.fold (updateFewestCoinsMap coins) (Map.ofList [(0, [])])
    |> Map.tryFind amount
