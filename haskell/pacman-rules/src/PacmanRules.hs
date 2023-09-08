module PacmanRules (eatsGhost, scores, loses, wins) where

eatsGhost :: Bool -> Bool -> Bool
eatsGhost powerPelletActive touchingGhost =
  powerPelletActive && touchingGhost

scores :: Bool -> Bool -> Bool
scores touchingPowerPellet touchingDot =
  touchingPowerPellet || touchingDot

loses :: Bool -> Bool -> Bool
loses powerPelletActive touchingGhost =
  not powerPelletActive && touchingGhost

wins :: Bool -> Bool -> Bool -> Bool
wins eatenAllDots powerPelletActive touchingGhost =
  eatenAllDots && not (loses powerPelletActive touchingGhost)
