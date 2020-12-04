module ListOps exposing (..)


length : List a -> Int
length list =
    foldl (\_ acc -> acc + 1) 0 list


reverse : List a -> List a
reverse list =
    foldl (::) [] list


map : (a -> b) -> List a -> List b
map func list =
    foldr (\x acc -> func x :: acc) [] list


filter : (a -> Bool) -> List a -> List a
filter func list =
    foldr
        (\x acc ->
            if func x then
                x :: acc
            else
                acc
        )
        []
        list


foldl : (a -> b -> b) -> b -> List a -> b
foldl func state list =
    case list of
        [] ->
            state

        hd :: tl ->
            foldl func (func hd state) tl


foldr : (a -> b -> b) -> b -> List a -> b
foldr func state list =
    case list of
        [] ->
            state

        hd :: tl ->
            func hd (foldr func state tl)


append : List a -> List a -> List a
append left right =
    foldr (::) right left


concat : List (List a) -> List a
concat list =
    foldr append [] list