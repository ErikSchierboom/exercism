module HelloWorld exposing (..)

import Maybe exposing (withDefault)


helloWorld : Maybe String -> String
helloWorld name =
    "Hello, " ++ (withDefault "World" name) ++ "!"
