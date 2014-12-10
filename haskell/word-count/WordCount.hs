module WordCount (wordCount) where

import Data.Map.Strict (Map, empty, insertWith)
import Data.Char (isAlphaNum, toLower)

wordCount :: String -> Map String Int
wordCount sentence = wordsWithCount where
	normalizeCharacter c 
		| isAlphaNum c = toLower c
		| otherwise = ' '		
	normalizedWords = words $ map normalizeCharacter sentence	
	updateWordCount wordMap word = insertWith (\_ old -> old + 1) word 1 wordMap
	wordsWithCount = foldl updateWordCount empty normalizedWords