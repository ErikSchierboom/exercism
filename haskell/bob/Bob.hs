module Bob (responseFor) where

import Data.Char (isLetter, isSpace, toUpper)

responseFor :: String -> String
responseFor sentence
    | isSilence = "Fine. Be that way!"
    | isShout = "Whoa, chill out!"
    | isQuestion = "Sure."    
    | otherwise = "Whatever." where
        isSilence = all isSpace sentence
        isQuestion = last sentence == '?'
        isUpper = map toUpper sentence == sentence
        isShout = isUpper && containsLetter
        containsLetter = any isLetter sentence        