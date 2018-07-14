module Base (rebase) where

import Data.Tuple (swap)
import Data.List (unfoldr)

toBase :: Integral a => a -> a -> [a]
toBase outputBase n = reverse $ unfoldr aux n where
    aux 0 = Nothing 
    aux n = Just $ swap $ n `divMod` outputBase

fromBase :: Integral a => a -> [a] -> Maybe a
fromBase inputBase [] = Nothing
fromBase inputBase nums = aux 0 nums where
    aux acc [] = Just acc 
    aux acc (digit:rest)
        | digit < 0 = Nothing
        | digit >= inputBase = Nothing
        | otherwise = aux (acc * inputBase + digit) rest

rebase :: Integral a => a -> a -> [a] -> Maybe [a]
rebase inputBase outputBase inputDigits
    | inputBase < 2 = Nothing 
    | outputBase < 2 = Nothing
    | null inputDigits = Just []
    | otherwise = fmap (toBase outputBase) (fromBase inputBase inputDigits)