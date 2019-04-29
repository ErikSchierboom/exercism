module ResistorColors (Color(..), value) where

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
  deriving (Eq, Show, Read)

value :: [Color] -> Int
value cs = foldl (\acc color -> acc * 10 + colorValue color) 0 cs

colorValue :: Color -> Int
colorValue Black  = 0
colorValue Brown  = 1
colorValue Red    = 2
colorValue Orange = 3
colorValue Yellow = 4
colorValue Green  = 5
colorValue Blue   = 6
colorValue Violet = 7
colorValue Grey   = 8
colorValue White  = 9