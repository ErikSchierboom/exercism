module Say (inEnglish) where

import Data.Maybe (catMaybes)
import qualified Data.Vector as V

inEnglish :: Integral a => a -> Maybe String
inEnglish n 
    | n < 0 || n >= 1000000000000 = Nothing
    | n == 0 = Just "zero"
    | otherwise = Just $ unwords $ catMaybes [ billions billionsCount
                                             , millions millionsCount
                                             , thousands thousandsCount
                                             , hundreds remainder]
     where
      (billionsCount, millionsCount, thousandsCount, remainder) = parts n

parts :: Integral a => a -> (Int, Int, Int, Int)
parts n = ( fromIntegral billionsCount
          , fromIntegral millionsCount
          , fromIntegral thousandsCount
          , fromIntegral remainder) where
  (billionsCount, billionsRemainder) = n `quotRem` 1000000000
  (millionsCount, millionsRemainder) = billionsRemainder `quotRem` 1000000
  (thousandsCount, remainder) = millionsRemainder `quotRem` 1000

base :: Int -> Maybe String
base n = values V.!? (n - 1) where
    values = V.fromList [ "one"
                        , "two"
                        , "three"
                        , "four"
                        , "five"
                        , "six"
                        , "seven"
                        , "eight"
                        , "nine"
                        , "ten"
                        , "eleven"
                        , "twelve"
                        , "thirteen"
                        , "fourteen"
                        , "fifteen"
                        , "sixteen"
                        , "seventeen"
                        , "eighteen"
                        , "nineteen"]

tens :: Int -> Maybe String
tens n = 
    if n < 20 then base n
    else Just $ countStr ++ maybe "" ("-" ++) (base remainder) where
        (count, remainder) = n `quotRem` 10
        countStr = values V.! (count - 2) 
        values = V.fromList [ "twenty"
                            , "thirty"
                            , "forty"
                            , "fifty"
                            , "sixty"
                            , "seventy"
                            , "eighty"
                            , "ninety"]

hundreds :: Int -> Maybe String
hundreds n = 
    if n < 100 then tens n
    else fmap (++ " hundred" ++ tensStr) (base count) where
      tensStr = maybe "" (" " ++) (tens remainder)
      (count, remainder) = n `quotRem` 100

thousands :: Int -> Maybe String
thousands = chunk "thousand"

millions :: Int -> Maybe String
millions = chunk "million"

billions :: Int -> Maybe String
billions = chunk "billion"

chunk :: String -> Int -> Maybe String
chunk str = fmap (++ " " ++ str) . hundreds