module ResistorColors (Color(..), Resistor(..), label, ohms) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

label :: Resistor -> String
label resistor = show ohms'' ++ " " ++ unit'
  where
    ohms' = ohms resistor
    (ohms'', unit') = 
      if ohms' >= 1000000000 then (ohms' `div` 1000000000, "gigaohms")
      else if ohms' >= 1000000 then (ohms' `div` 1000000, "megaohms")
      else if ohms' >= 1000 then (ohms' `div` 1000, "kiloohms")
      else (ohms', "ohms")
  
ohms :: Resistor -> Int
ohms (Resistor (first, second, third)) = 
  (fromEnum first * 10 + fromEnum second) * (10 ^ fromEnum third)
