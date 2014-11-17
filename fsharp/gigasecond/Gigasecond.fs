module Gigasecond

open System

type Gigasecond(beginDate: DateTime) = 
    member this.Date = beginDate.AddSeconds(1000000000.0).Date

