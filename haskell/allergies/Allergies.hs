module Allergies (Allergen(..), isAllergicTo, allergies) where

import Data.Bits (shift, (.&.))

data Allergen = Eggs | Peanuts | Shellfish | Strawberries | Tomatoes | Chocolate | Pollen | Cats
	deriving (Enum, Show, Eq)

allergies :: Int -> [Allergen]
allergies code = filter (`isAllergicTo` code) [Eggs ..]

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergen code = allergenMask allergen .&. code /= 0

allergenMask :: Allergen -> Int
allergenMask allergen = 1 `shift` fromEnum allergen