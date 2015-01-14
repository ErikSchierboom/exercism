module Binary (toDecimal) where

import Data.Maybe (fromMaybe)

toDecimal :: String -> Int
toDecimal binary = fromMaybe 0 $ parseDigits binary

parseDigits :: String -> Maybe Int
parseDigits = foldl parseDigit $ Just 0

parseDigit :: Maybe Int -> Char -> Maybe Int
parseDigit (Just acc) '0' = Just $ acc * 2
parseDigit (Just acc) '1' = Just $ acc * 2 + 1
parseDigit _ _ = Nothing