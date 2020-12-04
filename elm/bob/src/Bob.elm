module Bob exposing (..)

import String
import Char

isSilence : String -> Bool
isSilence = String.trim >> String.isEmpty 

isQuestion : String -> Bool
isQuestion = String.endsWith "?"

isShout: String -> Bool
isShout sentence = 
    String.toUpper sentence == sentence &&
    String.any Char.isUpper sentence

hey : String -> String
hey sentence = 
    if isSilence sentence then
        "Fine. Be that way!"   
    else if isShout sentence then
        "Whoa, chill out!"
    else if isQuestion sentence then
        "Sure."  
    else
        "Whatever."