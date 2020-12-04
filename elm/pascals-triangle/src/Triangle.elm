module Triangle exposing (rows)

import List exposing (map, range, foldl, reverse)
import Tuple exposing (first)


column : Int -> Int -> Int -> Int
column n m previous =
    previous * (n - m) // m


row : Int -> List Int
row n =
    range 1 (n - 1)
        |> foldl (\m ( acc, previous ) -> ( column n m previous :: acc, column n m previous )) ( [ 1 ], 1 )
        |> first
        |> reverse


rows : Int -> List (List Int)
rows n =
    range 1 n
        |> map row
