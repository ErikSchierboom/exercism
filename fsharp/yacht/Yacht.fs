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

type Die =
    | One
    | Two
    | Three
    | Four
    | Five
    | Six
    
let private dieScore (die: Die): int =
    match die with
    | One   -> 1
    | Two   -> 2
    | Three -> 3
    | Four  -> 4
    | Five  -> 5
    | Six   -> 6

let private scoreSingleNumber dice goalDie =
    dice
    |> List.filter (fun die -> die = goalDie)
    |> List.sumBy dieScore

let private scoreFullHouse dice =
    match List.countBy id dice with
    | [(_, 2); (_, 3)] -> List.sumBy dieScore dice
    | _ -> 0

let private scoreFourOfAKind dice =
    match List.countBy id dice with
    | [(die, 5)] | [_; (die, 4)] | [(die, 4); _] -> dieScore die * 4
    | _ -> 0

let private scoreLittleStraight dice =
    if List.sort dice = [Die.One; Die.Two; Die.Three; Die.Four; Die.Five] then 30 else 0
    
let private scoreBigStraight dice =
    if List.sort dice = [Die.Two; Die.Three; Die.Four; Die.Five; Die.Six] then 30 else 0
    
let private scoreChoice dice = List.sumBy dieScore dice

let private scoreYacht dice =
    if List.distinct dice |> List.length = 1 then 50 else 0

let score category dice =
    match category with
    | Ones           -> scoreSingleNumber dice Die.One
    | Twos           -> scoreSingleNumber dice Die.Two
    | Threes         -> scoreSingleNumber dice Die.Three
    | Fours          -> scoreSingleNumber dice Die.Four
    | Fives          -> scoreSingleNumber dice Die.Five
    | Sixes          -> scoreSingleNumber dice Die.Six
    | FullHouse      -> scoreFullHouse dice
    | FourOfAKind    -> scoreFourOfAKind dice
    | LittleStraight -> scoreLittleStraight dice
    | BigStraight    -> scoreBigStraight dice
    | Choice         -> scoreChoice dice
    | Yacht          -> scoreYacht dice
 