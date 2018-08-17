module Accumulate

let accumulate func input = [ for x in input do yield func x ]