module CarsAssemble

let private carsPerHour = 221

let private successRate speed =
    match speed with
    | 0 -> 0.0
    | 1 | 2 | 3 | 4 -> 1.0
    | 5 | 6 | 7 | 8 -> 0.9
    | 9 -> 0.8
    | 10 -> 0.77
    | _ -> failwith "Invalid speed"

let productionRatePerHour speed =
    float (speed * carsPerHour) * successRate speed

let workingItemsPerMinute speed =
   int (productionRatePerHour speed / 60.0)
