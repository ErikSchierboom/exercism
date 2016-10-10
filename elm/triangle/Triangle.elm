module Triangle exposing (..)

import Set


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : number -> number -> number -> Result String Triangle
triangleKind x y z =
    let
        invalidLengths =
            (x == 0 && y == 0 && z == 0)
                || (x < 0 || y < 0 || z < 0)

        isInvalid =
            x + y <= z || x + z <= y || y + z <= x

        equalSides =
            [ x, y, z ] |> Set.fromList |> Set.size
    in
        if invalidLengths then
            Err "Invalid lengths"
        else if isInvalid then
            Err "Violates inequality"
        else
            case equalSides of
                2 ->
                    Ok Isosceles

                1 ->
                    Ok Equilateral

                _ ->
                    Ok Scalene
