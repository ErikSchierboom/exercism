import math, tables

const EarthYearInSeconds = 31_557_600.0

const OrbitalPeriodsInEarthYears = {
  "Mercury": 0.2408467,
  "Venus"  : 0.61519726,
  "Earth"  : 1.0,
  "Mars"   : 1.8808158,
  "Jupiter": 11.862615,
  "Saturn" : 29.447498,
  "Uranus" : 84.016846,
  "Neptune": 164.79132,
}.toTable

proc inEarthYears(age: int64): float =
  float(age) / EarthYearInSeconds

proc onPlanet(age: int64, planet: string): float =
  age.inEarthYears / OrbitalPeriodsInEarthYears[planet]

proc age*(planet: string, age: int64): float =
  age.onPlanet(planet).round(2)
