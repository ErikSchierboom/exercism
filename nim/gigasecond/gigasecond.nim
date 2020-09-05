import times

let gigasecond = initDuration(seconds = 1_000_000_000)

proc addGigasecond*(moment: DateTime): DateTime =
    moment + gigasecond
