module RotationalCipher (rotate) where

import Data.List (elemIndex, length)
import Data.Char (isLower, isLetter)
import Data.Maybe (fromJust)

lowerCaseLetters :: [Char]
lowerCaseLetters = ['a' .. 'z']

upperCaseLetters :: [Char]
upperCaseLetters = ['A' .. 'Z']

keyForLetter :: Char -> [Char]
keyForLetter letter = if isLower letter then lowerCaseLetters else upperCaseLetters

rotateLetterUsingKey :: Int -> [Char] -> Char -> Char
rotateLetterUsingKey shiftKey key letter = key !! (shiftIndex `mod` length key)
    where
        shiftIndex = shiftKey + (fromJust $ elemIndex letter key)

rotateLetter :: Int -> Char -> Char
rotateLetter shiftKey letter 
    | isLetter letter = rotateLetterUsingKey shiftKey (keyForLetter letter) letter
    | otherwise = letter

rotate :: Int -> String -> String
rotate shiftKey text = map (rotateLetter shiftKey) text
