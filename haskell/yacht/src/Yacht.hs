module Yacht (yacht, Category (..)) where

import Data.List (group, sort)

data Category
  = Ones
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

yacht :: Category -> [Int] -> Int
yacht category dice =
  case category of
    Ones -> sumOfDice 1
    Twos -> sumOfDice 2
    Threes -> sumOfDice 3
    Fours -> sumOfDice 4
    Fives -> sumOfDice 5
    Sixes -> sumOfDice 6
    FullHouse
      | diceCounts == [2, 3] -> sum dice
      | otherwise -> 0
    FourOfAKind
      | diceCounts == [1, 4] -> 4 * head (tail sortedDice)
      | diceCounts == [5] -> 4 * head dice
      | otherwise -> 0
    LittleStraight
      | sortedDice == [1, 2, 3, 4, 5] -> 30
      | otherwise -> 0
    BigStraight
      | sortedDice == [2, 3, 4, 5, 6] -> 30
      | otherwise -> 0
    Choice -> sum dice
    Yacht
      | diceCounts == [5] -> 50
      | otherwise -> 0
  where
    sumOfDice die = sum $ filter (== die) dice
    sortedDice = sort dice
    diceCounts = sort $ map length $ group sortedDice
