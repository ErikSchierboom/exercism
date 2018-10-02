module RailFenceCipher (encode, decode) where

import Data.List (find, filter, zip, sortOn)
import Data.List.Index (imap)
import Data.Maybe (fromJust)

track :: Int -> Int -> Int
track rails index = 
    if correct index then 0
    else if correct (index - rails + 1) then rails - 1
    else fromJust $ find (\i -> correct (index - i) || correct (index - size + i)) [1 .. (rails - 2)]
    where
        size = rails * 2 - 2
        correct i = i `mod` size == 0

encode :: Int -> String -> String
encode rails message = concatMap charsForRails [0 .. rails - 1]
    where
        charsWithTrack = imap (\index character -> (track rails index, character)) message
        charsForRails rail = map snd $ filter (\x -> fst x == rail) charsWithTrack

decode :: Int -> String -> String
decode rails message = map fst $ sortOn snd charsWithRail
    where
        railsForChars = map fst $ sortOn snd $ map (\i -> (i, track rails i)) [0 .. length message - 1]
        charsWithRail = zip message railsForChars