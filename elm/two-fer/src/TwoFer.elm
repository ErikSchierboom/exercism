module TwoFer exposing (twoFer)

import Maybe exposing (withDefault)

twoFer : Maybe String -> String
twoFer name = "One for " ++ withDefault "you" name ++ ", one for me."
