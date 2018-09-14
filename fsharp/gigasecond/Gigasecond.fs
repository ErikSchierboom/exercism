module Gigasecond

open System

let add (beginDate: DateTime) = beginDate.AddSeconds(1E9)