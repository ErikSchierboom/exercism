module PigLatin (translate) where

import Control.Applicative ((<|>), (<$>))
import Data.Maybe (fromMaybe)
import Data.List (isPrefixOf, find)

translate :: String -> String
translate = unwords . map translateWord . words

translateWord :: String -> String
translateWord word = fromMaybe (translateSingleLetterConsonantWord word) 
	(translateVowelWord word <|> 
	 translateMultiLetterConsonantWord word <|> 
	 translateQuConsonantWord word)

translateVowelWord :: String -> Maybe String
translateVowelWord word = mapPrefix (vowelWordToPigLatin word) ["a", "e", "i", "u", "yt", "xr"] word 
	
vowelWordToPigLatin :: String -> String -> String
vowelWordToPigLatin word vowel = vowel ++ drop (length vowel) word ++ "ay"

translateMultiLetterConsonantWord :: String -> Maybe String
translateMultiLetterConsonantWord word = mapPrefix (consonantWordToPigLatin word) ["ch", "qu", "thr", "th", "sch", "yt"] word

translateSingleLetterConsonantWord :: String -> String
translateSingleLetterConsonantWord word = drop 1 word ++ take 1 word ++ "ay"

translateQuConsonantWord :: String -> Maybe String
translateQuConsonantWord word 
	| "qu" == take 2 (drop 1 word) = Just $ drop 3 word ++ take 1 word ++ "quay"
	| otherwise = Nothing

consonantWordToPigLatin :: String -> String -> String
consonantWordToPigLatin word consonant = drop (length consonant) word ++ consonant ++ "ay"

mapPrefix :: (String -> String) -> [String] -> String -> Maybe String
mapPrefix convert prefixes word = convert <$> find (`isPrefixOf` word) prefixes