module Bob exposing (..)

import String exposing (trim, isEmpty, endsWith, toUpper, any)
import Char exposing (isUpper)


isSilence : String -> Bool
isSilence =
    trim >> isEmpty


isQuestion : String -> Bool
isQuestion =
    endsWith "?"


isShout : String -> Bool
isShout sentence =
    toUpper sentence
        == sentence
        && any isUpper sentence


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
