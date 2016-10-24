module Gigasecond exposing (add)

import Date exposing (Date, toTime, fromTime)
import Time exposing (Time, second)


gigasecond : Time
gigasecond =
    second * 1000000000


add : Date -> Date
add date =
    toTime date + gigasecond |> fromTime
