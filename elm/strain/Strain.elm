module Strain exposing (..)

import List exposing (reverse)


keep : (a -> Bool) -> List a -> List a
keep pred input =
    let
        aux acc remainder =
            case remainder of
                [] ->
                    reverse acc

                hd :: tl ->
                    if pred hd then
                        aux (hd :: acc) tl
                    else
                        aux acc tl
    in
        aux [] input


discard : (a -> Bool) -> List a -> List a
discard pred input =
    keep (pred >> not) input
