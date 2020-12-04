module BinarySearch exposing (find)

import Array exposing (Array)


findInBounds : Int -> Array Int -> Int -> Int -> Int
findInBounds target xs left right =
    let
        middle =
            (left + right) // 2
    in
    case Array.get middle xs of
        Just x ->
            if x == target then
                middle

            else if left > right then
                -1

            else if target < x then
                findInBounds target xs left (middle - 1)

            else
                findInBounds target xs (middle + 1) right

        Nothing ->
            -1


find : Int -> Array Int -> Int
find target xs =
    findInBounds target xs 0 (Array.length xs)
