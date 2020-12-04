module RobotSimulator exposing (..)

import String exposing (foldl)


type Bearing
    = North
    | East
    | West
    | South


type alias Coordinates =
    { x : Int
    , y : Int
    }


type alias Robot =
    { bearing : Bearing
    , coordinates : Coordinates
    }


defaultRobot : Robot
defaultRobot =
    Robot North { x = 0, y = 0 }


turnLeft : Robot -> Robot
turnLeft { bearing, coordinates } =
    case bearing of
        North ->
            Robot West coordinates

        East ->
            Robot North coordinates

        West ->
            Robot South coordinates

        South ->
            Robot East coordinates


turnRight : Robot -> Robot
turnRight { bearing, coordinates } =
    case bearing of
        North ->
            Robot East coordinates

        East ->
            Robot South coordinates

        West ->
            Robot North coordinates

        South ->
            Robot West coordinates


advance : Robot -> Robot
advance { bearing, coordinates } =
    case bearing of
        North ->
            Robot bearing { coordinates | y = coordinates.y + 1 }

        East ->
            Robot bearing { coordinates | x = coordinates.x + 1 }

        West ->
            Robot bearing { coordinates | x = coordinates.x - 1 }

        South ->
            Robot bearing { coordinates | y = coordinates.y - 1 }


applyInstruction : Char -> Robot -> Robot
applyInstruction instruction robot =
    case instruction of
        'L' ->
            turnLeft robot

        'R' ->
            turnRight robot

        'A' ->
            advance robot

        _ ->
            robot


simulate : String -> Robot -> Robot
simulate instructions robot =
    foldl applyInstruction robot instructions