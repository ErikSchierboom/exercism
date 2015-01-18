module Raindrops (convert) where

raindrops :: [(Int, String)]
raindrops = [(3, "Pling"), (5, "Plang"), (7, "Plong")]

convert :: Int -> String
convert number = case drops of
	[] -> show number
	xs -> xs 
	where 
		drops = concatMap snd $ filter (isFactor number . fst) raindrops

isFactor :: Int -> Int -> Bool
isFactor number factor = number `mod` factor == 0