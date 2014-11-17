module SpaceAge

open System

type Planets = 
    | Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Neptune
    | Uranus

type SpaceAge(seconds: decimal) = 

    let secondsOnEarth = 31557600m;
    let yearsUsingPeriod (period:decimal) = Math.Round((seconds / period) / secondsOnEarth, 2)

    let planetPeriods = 
      [Mercury, 0.2408467m;
       Venus,   0.61519726m;
       Earth,   1.0m;
       Mars,    1.8808158m;
       Jupiter, 11.862615m;
       Saturn,  29.447498m;
       Uranus,  84.016846m;
       Neptune, 164.79132m] 
       |> Map.ofList

    let planetPeriod planet = yearsUsingPeriod planetPeriods.[planet]

    member this.Seconds = seconds
    member this.onMercury() = planetPeriod Mercury
    member this.onVenus() = planetPeriod Venus
    member this.onEarth() = planetPeriod Earth
    member this.onMars() = planetPeriod Mars
    member this.onJupiter() = planetPeriod Jupiter
    member this.onSaturn() = planetPeriod Saturn
    member this.onNeptune() = planetPeriod Neptune
    member this.onUranus() = planetPeriod Uranus

