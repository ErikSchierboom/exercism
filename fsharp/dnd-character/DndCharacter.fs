module DndCharacter

open System

let random = Random()

let private minDieValue = 1
let private maxDieValue = 6

let private rollDie() = random.Next(minDieValue, maxDieValue + 1);

let private diceRolls() = Seq.initInfinite (fun _ -> rollDie())

let modifier (score: int) = (float score - 10.0) / 2.0 |> floor |> int

let ability() =
    diceRolls()
    |> Seq.take 4
    |> Seq.sort
    |> Seq.tail
    |> Seq.sum

type DndCharacter() =
    member val Strength = ability()
    member val Dexterity = ability()
    member val Constitution = ability()
    member val Intelligence = ability()
    member val Wisdom = ability()
    member val Charisma = ability()
    member this.Hitpoints with get() = 10 + modifier(this.Constitution)

