import math, strformat

type
  Clock = int
  Time = (int, int)

const MinutesPerHour = 60
const HoursPerDay = 24
const MinutesPerDay = HoursPerDay * MinutesPerHour

proc create*(time: Time): Clock =
  let (hours, minutes) = time
  floorMod(hours * MinutesPerHour + minutes, MinutesPerDay)

proc add*(time: Time, minutesToAdd: int): Clock =
  let (hours, minutes) = time
  create((hours, minutes + minutesToAdd))

proc subtract*(time: Time, minutesToSubtract: int): Clock =
  let (hours, minutes) = time
  create((hours, minutes - minutesToSubtract))

proc hours(clock: Clock): int =
  clock div MinutesPerHour

proc minutes(clock: Clock): int =
  clock mod MinutesPerHour

proc toStr*(clock: Clock): string =
  &"{clock.hours:02}:{clock.minutes:02}"
