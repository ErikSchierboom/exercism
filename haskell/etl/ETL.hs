module ETL (transform) where

import Data.Map (Map, fromList, foldWithKey)
import Data.Char (toLower)

transform :: Map Int [String] -> Map String Int
transform input = fromList tuples where
	tuples = foldWithKey (\key values acc -> acc ++ toTuple key values) [] input
	toTuple key values = map (\v -> (lower v, key)) values
	lower = map toLower