module ProteinTranslation(proteins) where

import Data.List.Split (chunksOf)
import Data.List (foldr, reverse)

codonToProtein :: String -> Maybe String
codonToProtein codon =
    case codon of
        "AUG" -> Just "Methionine"
        "UUU" -> Just "Phenylalanine"
        "UUC" -> Just "Phenylalanine"
        "UUA" -> Just "Leucine"
        "UUG" -> Just "Leucine"
        "UCU" -> Just "Serine"
        "UCC" -> Just "Serine"
        "UCA" -> Just "Serine"
        "UCG" -> Just "Serine"
        "UAU" -> Just "Tyrosine"    
        "UAC" -> Just "Tyrosine"
        "UGU" -> Just "Cysteine"
        "UGC" -> Just "Cysteine"
        "UGG" -> Just "Tryptophan"
        "UAA" -> Just "STOP"
        "UAG" -> Just "STOP" 
        "UGA" -> Just "STOP"
        otherwise -> Nothing

codonsToProteins :: Maybe [String] -> [String] -> Maybe [String]
codonsToProteins Nothing _ = Nothing
codonsToProteins (Just proteins) [] = (Just $ reverse proteins)
codonsToProteins (Just proteins) (codon:xs) =
    case codonToProtein codon of
        Just "STOP" -> (Just $ reverse proteins)
        Just protein -> codonsToProteins (Just $ protein : proteins) xs
        _ -> Nothing

proteins :: String -> Maybe [String]
proteins strand = codonsToProteins (Just []) codons
    where
        codons = chunksOf 3 strand
