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

let private (|SingleThrow|) (target: Die) (dice: Die list): int =
    dice
    |> List.filter (fun die -> die = target)
    |> List.length

let private (|FullHouseThrow|_|) (dice: Die list): unit option =
    match List.countBy id dice |> List.sortBy snd with
    | [(_, 2); (_, 3)] -> Some ()
    | _ -> None

let private (|FourOfAKindThrow|_|) (dice: Die list): Die option =
    match List.countBy id dice |> List.sortBy snd with
    | [(number, 5)] | [_; (number, 4)] -> Some number
    | _ -> None

let private (|LittleStraightThrow|_|) (dice: Die list): unit option =
    match List.sort dice with
    | [Die.One; Die.Two; Die.Three; Die.Four; Die.Five] -> Some ()
    | _ -> None

let private (|BigStraightThrow|_|) (dice: Die list): unit option =
    match List.sort dice with
    | [Die.Two; Die.Three; Die.Four; Die.Five; Die.Six] -> Some ()
    | _ -> None

let private (|YachtThrow|_|) (dice: Die list): unit option =
    match List.distinct dice with
    | [_] -> Some ()
    | _ -> None

let score (category: Category) (dice: Die list): int =
    match category, dice with
    | Ones,           SingleThrow Die.One count   -> count * 1
    | Twos,           SingleThrow Die.Two count   -> count * 2
    | Threes,         SingleThrow Die.Three count -> count * 3
    | Fours,          SingleThrow Die.Four count  -> count * 4
    | Fives,          SingleThrow Die.Five count  -> count * 5
    | Sixes,          SingleThrow Die.Six count   -> count * 6
    | FullHouse,      FullHouseThrow              -> List.sumBy dieScore dice
    | FourOfAKind,    FourOfAKindThrow die        -> dieScore die * 4
    | LittleStraight, LittleStraightThrow         -> 30
    | BigStraight,    BigStraightThrow            -> 30
    | Yacht,          YachtThrow                  -> 50
    | Choice,         _                           -> List.sumBy dieScore dice
    | _,              _                           -> 0
