module Allergies (Allergen(..), isAllergicTo, allergies) where

import Data.Bits (testBit)

data Allergen = Eggs | Peanuts | Shellfish | Strawberries | Tomatoes | Chocolate | Pollen | Cats
	deriving (Enum, Show, Eq, Bounded)

allergies :: Int -> [Allergen]
allergies code = filter (`isAllergicTo` code) [minBound ..]

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergen code = testBit code $ fromEnum allergen