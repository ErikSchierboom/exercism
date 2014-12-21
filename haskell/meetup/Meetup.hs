module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day, fromGregorian)

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
data Schedule = Teenth | First | Second | Third | Fourth | Last

meetupDay :: Schedule -> Weekday -> Int -> Int -> Day
meetupDay schedule weekDay year day = fromGregorian 2043 1 1