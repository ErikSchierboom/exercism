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
label resistor = 
  case ohms resistor of
      ohms' | ohms' >= 1000000000 -> show (ohms' `div` 1000000000) ++ " gigaohms"
      ohms' | ohms' >= 1000000 -> show (ohms' `div` 1000000) ++ " megaohms"
      ohms' | ohms' >= 1000 -> show (ohms' `div` 1000) ++ " kiloohms"
      ohms' -> show ohms' ++ " ohms"
  
ohms :: Resistor -> Int
ohms (Resistor (first, second, third)) = 
  (fromEnum first * 10 + fromEnum second) * (10 ^ fromEnum third)
