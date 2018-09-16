module CollatzConjecture exposing (collatz)


helper : Int -> Int -> Int
helper steps current =
    if current == 1 then
        steps
    else if current % 2 == 0 then
        helper (steps + 1) (current // 2)
    else
        helper (steps + 1) (current * 3 + 1)


collatz : Int -> Result String Int
collatz start =
    if start < 1 then
        Err "Only positive numbers are allowed"
    else
        Ok (helper 0 start)
