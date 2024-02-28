module DndCharacter exposing (Character, ability, character, modifier)

import Random exposing (Generator)


type alias Character =
    { strength : Int
    , dexterity : Int
    , constitution : Int
    , intelligence : Int
    , wisdom : Int
    , charisma : Int
    , hitpoints : Int
    }


modifier : Int -> Int
modifier score =
    floor ((toFloat score - 10) / 2)


ability : Generator Int
ability =
    Random.int 1 6
        |> Random.list 4
        |> Random.map (List.sort >> List.drop 1 >> List.sum)


character : Generator Character
character =
    Random.map5 Character ability ability ability ability ability
        |> Random.map2 (|>) ability
        |> Random.map2 (|>) (Random.constant 0)
        |> Random.map (\c -> { c | hitpoints = 10 + modifier (.constitution c) })
