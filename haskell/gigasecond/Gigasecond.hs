module Gigasecond (fromDay) where

import Data.Time.Calendar (Day, addDays)

fromDay :: Day -> Day
fromDay day = addDays gigasecondInDays day where
    gigaseconds = 1000000000
    gigasecondsInMinutes = gigaseconds `div` 60
    gigasecondsInHours = gigasecondsInMinutes `div` 60
    gigasecondInDays = gigasecondsInHours `div` 24