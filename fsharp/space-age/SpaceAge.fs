﻿module SpaceAge

type Planet = 
    | Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Neptune
    | Uranus

let private planetPeriodsInEarthYears = 
    [ Mercury, 0.2408467
      Venus,   0.61519726
      Earth,   1.0
      Mars,    1.8808158
      Jupiter, 11.862615
      Saturn,  29.447498
      Uranus,  84.016846
      Neptune, 164.79132 ] 
    |> Map.ofList

let age planet (seconds: int64) =
    let secondsOnEarth = 31557600.0
    let yearsUsingPeriod (period: float) = System.Math.Round((float seconds / period) / secondsOnEarth, 2)
        
    yearsUsingPeriod planetPeriodsInEarthYears.[planet]