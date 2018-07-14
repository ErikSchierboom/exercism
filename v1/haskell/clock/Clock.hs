{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Clock (fromHourMin, toString) where

import Text.Printf (printf)

newtype Clock = Clock { unClock :: Integer } 
    deriving (Show, Eq)

instance Num Clock where
  Clock mins1 + Clock mins2 = Clock (wrapMinutes $ mins1 + mins2)
  Clock mins1 - Clock mins2 = Clock (wrapMinutes $ mins1 - mins2)
  negate (Clock mins) = Clock (wrapMinutes $ -mins)
  fromInteger int = Clock (wrapMinutes int)
  (*) = undefined
  abs = undefined
  signum = undefined

fromHourMin :: Integer -> Integer -> Clock
fromHourMin hrs mins = fromInteger $ hrs * 60 + mins

toString :: Clock -> String
toString clock = printf "%02d:%02d" (hours clock) (minutes clock)

hours :: Clock -> Integer
hours = (`div` 60) . unClock

minutes :: Clock -> Integer
minutes = (`mod` 60) . unClock

wrapMinutes :: Integer -> Integer
wrapMinutes = flip mod minutesPerDay

minutesPerDay :: Integer
minutesPerDay = 1440