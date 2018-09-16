module Tests exposing (..)

import Acronym exposing (abbreviate)
import Expect
import Test exposing (Test, describe, skip, test)


tests : Test
tests =
    describe "Acronym"
        [ test "basic" <|
            \_ ->
                Expect.equal "PNG"
                    (abbreviate "Portable Network Graphics")
        , test "lowercase words" <|
            \_ ->
                Expect.equal "ROR"
                    (abbreviate "Ruby on Rails")
        , test "punctuation" <|
            \_ ->
                Expect.equal "FIFO"
                    (abbreviate "First In, First Out")
        , test "all caps word" <|
            \_ ->
                Expect.equal "GIMP"
                    (abbreviate "GNU Image Manipulation Program")
        , test "punctuation without whitespace" <|
            \_ ->
                Expect.equal "CMOS"
                    (abbreviate "Complementary metal-oxide semiconductor")
        ]
