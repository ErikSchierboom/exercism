import algorithm, math, sequtils, tables

type
  Category* = enum
    Ones, Twos, Threes, Fours, Fives, Sixes, FullHouse,
    FourOfAKind, LittleStraight, BigStraight, Choice, Yacht

proc largestCount(dice: array[5, int]): (int, int) =
  dice.toCountTable.largest

proc score*(dice: array[5, int], category: Category): int =
  case category
  of Ones:   dice.count(1) * 1
  of Twos:   dice.count(2) * 2
  of Threes: dice.count(3) * 3
  of Fours:  dice.count(4) * 4
  of Fives:  dice.count(5) * 5
  of Sixes:  dice.count(6) * 6
  of FullHouse: 
    let (_, count) = dice.largestCount
    if count == 3: dice.sum else: 0
  of FourOfAKind:
    let (die, count) = dice.largestCount
    if count >= 4: die * 4 else: 0
  of LittleStraight: (if dice.sorted == [1, 2, 3, 4, 5]: 30 else: 0)
  of BigStraight: (if dice.sorted == [2, 3, 4, 5, 6]: 30 else: 0)
  of Choice: dice.sum
  of Yacht: 
    let (_, count) = dice.largestCount
    if count == 5: 50 else: 0
