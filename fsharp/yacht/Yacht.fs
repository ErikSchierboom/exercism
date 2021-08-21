module Yacht

type Category =
    | Ones
    | Twos
    | Threes
    | Fours
    | Fives
    | Sixes
    | FullHouse
    | FourOfAKind
    | LittleStraight
    | BigStraight
    | Choice
    | Yacht

let private scoreSingleNumber dice number =
    dice
    |> List.filter (fun x -> x = number)
    |> List.sum

let private scoreFullHouse dice =
    match List.countBy id dice with
    | [(_, 2); (_, 3)] -> List.sum dice
    | _ -> 0

let private scoreFourOfAKind dice =
    match List.countBy id dice with
    | [(number, 5)] | [_; (number, 4)] | [(number, 4); _] -> number * 4
    | _ -> 0

let private scoreLittleStraight dice = if List.sort dice = [1 .. 5] then 30 else 0
let private scoreBigStraight dice = if List.sort dice = [2 .. 6] then 30 else 0
let private scoreChoice dice = List.sum dice
let private scoreYacht dice = if List.distinct dice |> List.length = 1 then 50 else 0

let score category dice =
    match category with
    | Ones           -> scoreSingleNumber dice 1
    | Twos           -> scoreSingleNumber dice 2
    | Threes         -> scoreSingleNumber dice 3
    | Fours          -> scoreSingleNumber dice 4
    | Fives          -> scoreSingleNumber dice 5
    | Sixes          -> scoreSingleNumber dice 6
    | FullHouse      -> scoreFullHouse dice
    | FourOfAKind    -> scoreFourOfAKind dice
    | LittleStraight -> scoreLittleStraight dice
    | BigStraight    -> scoreBigStraight dice
    | Choice         -> scoreChoice dice
    | Yacht          -> scoreYacht dice