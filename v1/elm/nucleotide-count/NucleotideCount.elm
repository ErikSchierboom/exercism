module NucleotideCount exposing (..)

import String exposing (foldl)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


empty : NucleotideCounts
empty =
    { a = 0, t = 0, c = 0, g = 0 }


nucleotideCounts : String -> NucleotideCounts
nucleotideCounts input =
    let
        folder letter counts =
            case letter of
                'A' ->
                    { counts | a = counts.a + 1 }

                'T' ->
                    { counts | t = counts.t + 1 }

                'C' ->
                    { counts | c = counts.c + 1 }

                'G' ->
                    { counts | g = counts.g + 1 }

                _ ->
                    counts
    in
        foldl folder empty input


version : Int
version =
    2
