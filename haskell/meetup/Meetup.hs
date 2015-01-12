module Meetup (Weekday(..), Schedule(..), meetupDay) where

import Data.Time.Calendar (Day, fromGregorian, gregorianMonthLength)
import Data.Time.Calendar.WeekDate (toWeekDate)

data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
    deriving (Enum, Eq)

data Schedule = First | Second | Third | Fourth | Last | Teenth
    deriving (Enum, Eq)

meetupDay :: Schedule -> Weekday -> Integer -> Int -> Day
meetupDay schedule weekDay year month = 
    case schedule of Teenth -> fst $ head $ take 1 $ filter (\(d,_) -> dayOfMonth d >= 13) weekDays
                     Last   -> fst $ last weekDays
                     x      -> fst $ head $ drop (fromEnum x) weekDays
    where monthDays = daysInMonth year month
          weekDays = filter (\(_,w) -> w == weekDay) monthDays

daysInMonth :: Integer -> Int -> [(Day, Weekday)]
daysInMonth year month = [dateToWeekday year month day | day <- [1..numberOfDays]] where
    numberOfDays = gregorianMonthLength year month

dateToWeekday :: Integer -> Int -> Int -> (Day, Weekday)
dateToWeekday year month day = (gregorianDay, weekDay) where
    gregorianDay = fromGregorian year month day
    (_, _, dayNumber) = toWeekDate gregorianDay
    weekDay = gregorianDayToWeekday dayNumber

dayOfMonth :: Day -> Int
dayOfMonth day = dayNumber where 
    (_, _, dayNumber) = toWeekDate day

gregorianDayToWeekday :: Int -> Weekday
gregorianDayToWeekday day = toEnum (pred day)::Weekday