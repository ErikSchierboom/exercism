module Bowling (score, BowlingError(..)) where

data BowlingError = IncompleteGame
                  | InvalidRoll { rollIndex :: Int, rollValue :: Int }
  deriving (Eq, Show)

numberOfFrames :: Int
numberOfFrames = 10

maximumFrameScore :: Int
maximumFrameScore = 10

minimumFrameScore :: Int
minimumFrameScore = 0

isStrike :: Int -> Bool
isStrike pins = pins == maximumFrameScore

isSpare :: Int -> Int -> Bool
isSpare pins1 pins2 = pins1 + pins2 == maximumFrameScore

isLastFrame :: Int -> Bool
isLastFrame frame = frame == numberOfFrames

gameFinished :: Int -> Bool
gameFinished frame = frame == numberOfFrames + 1

invalidPins :: Int -> Bool
invalidPins pins = pins < minimumFrameScore || pins > maximumFrameScore

validatePins :: Int -> Int -> Int -> Either BowlingError Int
validatePins rollIndex pin1 pin2
    | invalidPins pin1 = Left $ InvalidRoll rollIndex pin1
    | invalidPins pin2 = Left $ InvalidRoll (rollIndex + 1) pin2
    | invalidPins (pin1 + pin2) = Left $ InvalidRoll (rollIndex + 1) pin2
    | otherwise = Right (pin1 + pin2)

scoreRolls :: Int -> Int -> Int -> [Int] -> Either BowlingError Int
scoreRolls totalScore frame rollIndex remainder =
  case remainder of
    [] 
      | gameFinished frame -> Right totalScore 
      | otherwise -> Left IncompleteGame
    x:y:zs 
      | invalidPins x -> Left $ InvalidRoll rollIndex x
      | invalidPins y -> Left $ InvalidRoll (rollIndex + 1) y
      | isStrike x  -> scoreStrike (y:zs)
      | isSpare x y -> scoreSpare  x y zs
      | otherwise   -> scoreNormal x y zs
    x:xs
      | invalidPins x -> Left $ InvalidRoll rollIndex x
      | isStrike x -> scoreStrike xs
      | otherwise -> Left $ InvalidRoll rollIndex x
    where
      scoreStrike remainder = 
        case remainder of
          x:y:zs -> 
            if isLastFrame frame then
              if (x + y > 10 && x /= 10) || invalidPins y then 
                Left $ InvalidRoll (rollIndex + 2) y
              else 
                scoreRolls (totalScore + 10 + x + y) (frame + 1) (rollIndex + 1) zs
            else 
              scoreRolls (totalScore + 10 + x + y) (frame + 1) (rollIndex + 1) (x:y:zs)
          _ ->
              Left IncompleteGame

      scoreSpare x y remainder = 
        case remainder of 
          z:zs ->
            if isLastFrame frame then
              scoreRolls (totalScore + x + y + z) (frame + 1) (rollIndex + 2) zs
            else
              scoreRolls (totalScore + x + y + z) (frame + 1) (rollIndex + 2) (z:zs)
          _ -> Left IncompleteGame
 
      scoreNormal x y remainder =
        case validatePins rollIndex x y of
          Right z -> scoreRolls (totalScore + z) (frame + 1) (rollIndex + 2) remainder
          Left a -> Left a

score :: [Int] -> Either BowlingError Int
score = scoreRolls 0 1 0