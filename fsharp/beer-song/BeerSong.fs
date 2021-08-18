module BeerSong

let private bottlesOfBeer n =
    match n with
    | 0 -> "No more bottles of beer"
    | 1 -> "1 bottle of beer"
    | _ -> $"{n} bottles of beer"
    
let private instruction n =
    match n with
    | 0 -> "Go to the store and buy some more"
    | 1 -> "Take it down and pass it around"
    | _ -> "Take one down and pass it around"

let private firstVerseLine n =
    let bottles = bottlesOfBeer n 
    $"{bottles} on the wall, {bottles.ToLower()}."

let private secondVerseLine n =
    let bottles = bottlesOfBeer (if n = 0 then 99 else n - 1)
    $"{instruction n}, {bottles.ToLower()} on the wall."

let private verse n = [firstVerseLine n; secondVerseLine n]

let recite startBottles takeDown = 
    [startBottles .. -1 .. (startBottles - takeDown + 1)]
    |> List.map verse
    |> List.reduce (fun x y -> x @ "" :: y)
