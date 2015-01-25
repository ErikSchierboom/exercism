module CryptoSquare (normalizePlaintext,
                     squareSize,
                     plaintextSegments,
                     ciphertext,
                     normalizeCiphertext) where

import Data.List (transpose)
import Data.List.Split (chunksOf)
import Data.Char (toLower, isAlphaNum)

normalizePlaintext :: String -> String
normalizePlaintext = map toLower . filter isAlphaNum

squareSize :: String -> Int
squareSize = ceiling . (sqrt :: Double -> Double) . fromIntegral . length

plaintextSegments :: String -> [String]
plaintextSegments str = chunksOf (squareSize normalizedPlaintext) normalizedPlaintext
    where normalizedPlaintext = normalizePlaintext str

ciphertext :: String -> String
ciphertext = concat . transpose . plaintextSegments

normalizeCiphertext :: String -> String
normalizeCiphertext = unwords . transpose . plaintextSegments