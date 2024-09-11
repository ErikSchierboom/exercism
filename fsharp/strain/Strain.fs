module Seq

let keep pred elements =
    seq {
        for element in elements do
            if pred element then
                yield element
    }

let discard pred = keep (not << pred)
