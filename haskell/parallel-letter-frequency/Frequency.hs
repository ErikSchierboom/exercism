module Frequency (frequency) where

import Data.Char (isLetter)
import Control.Parallel.Strategies (using, parListChunk, rseq)
import qualified Data.Text as T
import qualified Data.Map as M

frequency :: Int -> [T.Text] -> M.Map Char Int
frequency workers texts = M.unionsWith (+) frequencies where
	chunks = chunkSize workers texts
	strategy = parListChunk chunks rseq
	frequencies = map textFrequency texts `using` strategy

chunkSize :: Int -> [T.Text] -> Int
chunkSize workers texts = ceiling chunks where
	chunks = fromIntegral (length texts) / fromIntegral workers :: Double

textFrequency :: T.Text -> M.Map Char Int
textFrequency = T.foldl' updateFrequency M.empty . T.toLower where
	updateFrequency acc char 
		| isLetter char = M.insertWith (+) char 1 acc
		| otherwise = acc