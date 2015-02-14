{-# LANGUAGE FlexibleInstances #-}

module SecretHandshake (handshake) where

import Data.Bits (testBit)

data Command = Wink | DoubleBlink | CloseYourEyes | Jump
	deriving (Enum, Eq, Bounded)

instance Show Command where
  show Wink = "wink"
  show DoubleBlink = "double blink"
  show CloseYourEyes = "close your eyes"
  show Jump = "jump"

class Binary a where
    fromValue :: a -> Int

instance Binary Int where
	fromValue int = int

instance Binary String where
	fromValue digits = binaryStringToInt digits 0

binaryStringToInt :: String -> Int -> Int
binaryStringToInt "" value = value
binaryStringToInt (digit:remainder) value =
    value `seq`
    case digit of
		'0' -> binaryStringToInt remainder (value * 2)
		'1' -> binaryStringToInt remainder (value * 2 + 1)
		_   -> 0

handshake :: Binary a => a -> [String]
handshake = map show . commands . fromValue

commands :: Int -> [Command]
commands code = filter (`commandEnabled` code) $ modify [minBound .. maxBound] where
	modify = if testBit code reverseCommand then reverse else id

commandEnabled :: Command -> Int -> Bool
commandEnabled command code = testBit code $ fromEnum command

reverseCommand :: Int
reverseCommand = 4

