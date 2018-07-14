module ETL (transform) where

import Data.Map (Map, fromList, foldWithKey)
import Data.Char (toLower)

transform :: Map Int [String] -> Map String Int
transform input = fromList $ foldWithKey transform' [] input where	
	transform' key values acc = map (\v -> (map toLower v, key)) values ++ acc	