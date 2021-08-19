module Clock

type Clock = Clock of Minutes:int

let private modulo x y = (x % y + y) % y

let private minutesPerHour = 60
let private minutesPerDay = 1440

let create hours minutes = Clock (modulo (hours * minutesPerHour + minutes) minutesPerDay)

let add minutesToAdd (Clock minutes) = create 0 (minutes + minutesToAdd)

let subtract minutesToSubtract (Clock minutes) = create 0 (minutes - minutesToSubtract)

let display (Clock minutes) = $"%02i{minutes / minutesPerHour}:%02i{minutes % minutesPerHour}"
