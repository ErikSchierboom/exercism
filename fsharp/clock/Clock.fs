module Clock

type Clock =
    { minutes: int }

let private modulo x y = int (((x % y) + y) % y)

let private minutesPerHour = 60
let private minutesPerDay = 1440

let create hours minutes = { minutes = modulo (hours * minutesPerHour + minutes) minutesPerDay }

let add minutes clock = create 0 (clock.minutes + minutes)

let subtract minutes clock = create 0 (clock.minutes - minutes)

let private hours clock = clock.minutes / minutesPerHour

let private minutes clock = clock.minutes % minutesPerHour

let display clock = sprintf "%02i:%02i" (hours clock) (minutes clock)
