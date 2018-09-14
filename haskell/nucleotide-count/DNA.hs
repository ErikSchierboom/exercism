module DNA (count, nucleotideCounts) where

import Data.Map (Map, fromList)

validNucleotides :: String
validNucleotides = "ATCG"

count :: Char -> String -> Int
count nucleotide strand 
    | isValid = length $ filter (== nucleotide) strand
    | otherwise = error $ "invalid nucleotide " ++ show(nucleotide) where
        isValid = elem nucleotide validNucleotides

nucleotideCounts :: String -> Map Char Int
nucleotideCounts strand = fromList $ map (\x -> (x, count x strand)) validNucleotides