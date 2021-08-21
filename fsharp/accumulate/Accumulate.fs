module Accumulate

let accumulate f seq = [ for x in seq -> f x ]
