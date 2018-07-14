{-# LANGUAGE OverloadedStrings #-}

module Alphametics (solve) where

import Data.Map.Strict (Map, fromList, toList, (!))
import Data.List (all, map, zip, notElem, subsequences, nub, foldl', find, permutations)
import Text.Parsec
import Text.Parsec.String

data Equation = Equation [String] String
    deriving (Show) 

solve :: String -> Maybe [(Char, Int)]
solve puzzle = parseEquation puzzle >>= trySolveEquation

trySolveEquation :: Equation -> Maybe [(Char, Int)]
trySolveEquation equation = find (`solveEquation` equation) $ generateValidMaps equation
    
solveEquation :: [(Char, Int)] -> Equation -> Bool
solveEquation charsToDigit equation = solveLeft charsToDigit equation == solveRight charsToDigit equation

solveLeft :: [(Char, Int)] -> Equation -> Int
solveLeft charsToDigit (Equation left _) = sum $ map (solveTerm charsToDigit) left

solveRight :: [(Char, Int)] -> Equation -> Int
solveRight charsToDigit (Equation _ right) = solveTerm charsToDigit right

solveTerm :: [(Char, Int)] -> String -> Int
solveTerm charsToDigit = digitsToInt . toDigits charsToDigit 

digitsToInt :: [Int] -> Int
digitsToInt = foldl' (\b a -> b * 10 + a) 0

toDigits :: [(Char, Int)] -> String -> [Int]
toDigits charsToDigit = map (\c -> digitsMap ! c ) where
    digitsMap = fromList charsToDigit

generateValidMaps :: Equation -> [[(Char, Int)]]
generateValidMaps equation = filter (all validCharToIntMap) allMaps where
    allMaps = generateMaps equation
    nonZeroLetters' = nonZeroLetters equation
    validCharToIntMap(c, i) = i /= 0 || notElem c nonZeroLetters' 

generateMaps :: Equation -> [[(Char, Int)]]
generateMaps equation = map (zip letters') $ digitCombinations (length letters') where
    letters' = letters equation

digitCombinations :: Int -> [[Int]]
digitCombinations n = concatMap permutations $ filter (\x -> n == length x) $ subsequences [0..9]

letters :: Equation -> String
letters (Equation left right) = nub $ concat (right:left)

nonZeroLetters :: Equation -> String
nonZeroLetters (Equation left right) = nub $ map head (right:left)

parseEquation :: String -> Maybe Equation
parseEquation = eitherToMaybe . parse equationParser "equation parser"

equationParser :: Parser Equation
equationParser = do 
    left <- termParser `sepBy1` plus
    equals
    right <- termParser
    return $ Equation left right

termParser :: Parser String
termParser = trim $ many1 upper

plus :: Parser Char
plus = trim $ char '+'

trim :: Parser a -> Parser a
trim parser = spaces *> parser <* spaces

equals :: Parser String
equals = string "=="

eitherToMaybe :: Either a b -> Maybe b
eitherToMaybe (Left _) = Nothing
eitherToMaybe (Right x) = Just x