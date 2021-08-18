module Change

let calculateFewestCoins coins map target =
    coins
    |> List.filter (fun coin -> coin <= target) 
    |> List.choose (fun coin -> Map.tryFind (target - coin) map |> Option.map (fun change -> coin :: change))
    |> List.sortBy List.length
    |> List.tryHead 

let updateFewestCoinsMap coins fewestCoinsMap amount = 
    match calculateFewestCoins coins fewestCoinsMap amount with
    | Some fewestCoins -> Map.add amount fewestCoins fewestCoinsMap
    | None -> fewestCoinsMap

let findFewestCoins coins amount = 
    [1..amount]
    |> List.fold (updateFewestCoinsMap coins) (Map.ofList [(0, [])])
    |> Map.tryFind amount
