import math, tables

type
  Category* = enum
    Ones, Twos, Threes, Fours, Fives, Sixes, FullHouse,
    FourOfAKind, LittleStraight, BigStraight, Choice, Yacht

func score*(dice: array[5, int], category: Category): int =
  let counts = dice.toCountTable

  case category
  of Ones:   counts[1] * 1
  of Twos:   counts[2] * 2
  of Threes: counts[3] * 3
  of Fours:  counts[4] * 4
  of Fives:  counts[5] * 5
  of Sixes:  counts[6] * 6
  of FullHouse: 
    if counts.len == 2 and counts.largest.val == 3: dice.sum else: 0
  of FourOfAKind:
    if counts.largest.val >= 4: counts.largest.key * 4 else: 0
  of LittleStraight:
    if counts.len == 5 and 6 notin dice: 30 else: 0
  of BigStraight:
    if counts.len == 5 and 1 notin dice: 30 else: 0
  of Yacht:
    if counts.len == 1: 50 else: 0
  of Choice: dice.sum
