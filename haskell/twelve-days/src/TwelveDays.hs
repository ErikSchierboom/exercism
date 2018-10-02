module TwelveDays (recite) where

import Data.List (map, intercalate)

numberToStr :: Int -> String
numberToStr number =
    case number of
        0  -> "a"
        1  -> "and a"
        2  -> "two"
        3  -> "three"
        4  -> "four"
        5  -> "five"
        6  -> "six"
        7  -> "seven"
        8  -> "eight"
        9  -> "nine"
        10 -> "ten"
        11 -> "eleven"
        12 -> "twelve"
        _ -> error "Invalid day"

countToStr :: Int -> String
countToStr count =
    case count of
        1  -> "first"
        2  -> "second"
        3  -> "third"
        4  -> "fourth"
        5  -> "fifth"
        6  -> "sixth"
        7  -> "seventh"
        8  -> "eighth"
        9  -> "ninth"
        10  -> "tenth"
        11 -> "eleventh"
        12 -> "twelfth"
        _  -> error "Invalid count"

subject :: Int -> String
subject number =
    case number of
        0  -> "Partridge in a Pear Tree"
        1  -> "Partridge in a Pear Tree"
        2  -> "Turtle Doves" 
        3  -> "French Hens" 
        4  -> "Calling Birds" 
        5  -> "Gold Rings" 
        6  -> "Geese-a-Laying" 
        7  -> "Swans-a-Swimming"
        8  -> "Maids-a-Milking"
        9  -> "Ladies Dancing" 
        10 -> "Lords-a-Leaping" 
        11 -> "Pipers Piping"
        12 -> "Drummers Drumming"
        _  -> error "Invalid subject"

subjectToStr :: Int -> String
subjectToStr number = numberToStr number ++ " " ++ subject number

verseBegin :: Int -> String
verseBegin number = "On the " ++ countToStr number ++ " day of Christmas my true love gave to me, "

verseEnd :: Int -> String
verseEnd number =
    if number == 1 then
        subjectToStr 0
    else
        intercalate ", " $ map subjectToStr $ reverse [1 .. number] 

verse :: Int -> String
verse number = verseBegin number ++ verseEnd number ++ "."

recite :: Int -> Int -> [String]
recite start stop = map verse [start..stop]
