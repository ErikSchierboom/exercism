module Strain (keep, discard) where

keep :: (a -> Bool) -> [a] -> [a]
keep f [] = []
keep f (x:xs)
	| f x = x : keep f xs
	| otherwise = keep f xs

discard :: (a -> Bool) -> [a] -> [a]
discard f = keep (not . f)