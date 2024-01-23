module Raindrops

let drops = [(3, "Pling"); (5, "Plang"); (7, "Plong")]

let convert number =
    match [for factor, sound in drops do if number % factor = 0 then yield sound] with
    | [] -> string number
    | sounds -> String.concat "" sounds
