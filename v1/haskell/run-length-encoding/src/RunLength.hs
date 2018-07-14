module RunLength (decode, encode) where

import Data.Char (digitToInt, isDigit)
import Data.List (foldr, group)
import Data.Maybe (maybe, fromMaybe)

decode :: String -> String
decode = fst . foldl decodeFolder ("", Nothing)

decodeFolder :: (String, Maybe Int) -> Char -> (String, Maybe Int)
decodeFolder (decoded, count) letter
    | isDigit letter =
        let 
            digit = digitToInt letter 
        in
            (decoded, Just $ maybe digit (\acc -> acc * 10 + digit) count)
    | otherwise =
        let 
            repetitions = fromMaybe 1 count
            updateDecoded = decoded ++ replicate repetitions letter
        in
            (updateDecoded, Nothing)

encode :: String -> String
encode = concatMap encodePartition . group

encodePartition :: String -> String
encodePartition []  = error "Cannot encode empty partition" 
encodePartition [x] = [x]
encodePartition (x:xs) = show (length xs + 1) ++ [x]