module HelloWorld exposing (..)

helloWorld : Maybe String -> String
helloWorld name =
    "Hello, " ++ (Maybe.withDefault "World" name) ++ "!"