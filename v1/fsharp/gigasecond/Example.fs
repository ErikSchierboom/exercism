module Gigasecond

open System

let gigasecond (beginDate: DateTime) = beginDate.AddSeconds(1000000000.0).Date

