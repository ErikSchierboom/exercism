module Sublist exposing (..)

import List exposing (length, drop)


type ListComparison
    = Equal
    | Unequal
    | Sublist
    | Superlist


isSublist : List a -> List a -> Int -> Int -> Bool
isSublist xs ys lx ly =
    let
        helper xs' ys' =
            case ( xs', ys' ) of
                ( [], _ ) ->
                    True

                ( _, [] ) ->
                    False

                ( x'' :: xs'', y'' :: ys'' ) ->
                    if x'' == y'' then
                        helper xs'' ys''
                    else
                        False
    in
        if lx > ly then
            False
        else if helper xs ys then
            True
        else
            isSublist xs (drop 1 ys) lx (ly - 1)


sublist : List a -> List a -> ListComparison
sublist xs ys =
    let
        lx =
            length xs

        ly =
            length ys
    in
        if lx < ly && isSublist xs ys lx ly then
            Sublist
        else if lx > ly && isSublist ys xs ly lx then
            Superlist
        else if xs == ys then
            Equal
        else
            Unequal


version : Int
version =
    2