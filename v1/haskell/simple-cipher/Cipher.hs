module Cipher (caesarEncode, caesarDecode, caesarEncodeRandom) where

import System.Random (newStdGen, randomRs)

caesarEncode :: String -> String -> String
caesarEncode = zipWith (shiftChar (+)) . cycle

caesarDecode :: String -> String -> String
caesarDecode = zipWith (shiftChar (-)) . cycle

caesarEncodeRandom :: String -> IO (String, String)
caesarEncodeRandom unencrypted = do
	g <- newStdGen
	let key = take (length unencrypted) (randomRs ('a', 'z') g)
	return (key, caesarEncode key unencrypted)

shiftChar :: (Int -> Int -> Int) -> Char -> Char -> Char
shiftChar operation key char = intToChar $ operation (charToInt char) (charToInt key)

charToInt :: Char -> Int
charToInt c = fromEnum c - fromEnum 'a'

intToChar :: Int -> Char
intToChar n = toEnum $ fromEnum 'a' +  n `mod` 26