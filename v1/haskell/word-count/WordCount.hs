module WordCount (wordCount) where

import Data.Map.Strict (Map, empty, insertWith)
import Data.Foldable (foldl')
import Data.List.Split (wordsBy)
import Data.Char (isAlphaNum, toLower)

wordCount :: String -> Map String Int
wordCount sentence = foldl' updateWordCount empty words' where	
	updateWordCount wordMap word = insertWith (\_ old -> old + 1) word 1 wordMap
	words' = wordsBy (not . isAlphaNum) (map toLower sentence)