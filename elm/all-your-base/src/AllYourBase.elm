module AllYourBase exposing (rebase)


invalidBase : Int -> Bool
invalidBase base =
    base < 2


invalidDigits : Int -> List Int -> Bool
invalidDigits inBase digits =
    List.all (\n -> n == 0) digits
        || List.any (\n -> n >= inBase || n < 0) digits


toInBaseInt : Int -> List Int -> Int
toInBaseInt inBase digits =
    List.foldl (\digit acc -> acc * inBase + digit) 0 digits


toOutBaseDigits : Int -> Int -> List Int
toOutBaseDigits outBase n =
    let
        helper digits m =
            let
                quotient =
                    m // outBase

                remainder =
                    m % outBase
            in
                if quotient == 0 then
                    remainder :: digits
                else
                    helper (remainder :: digits) quotient
    in
        helper [] n


rebase : Int -> List Int -> Int -> Maybe (List Int)
rebase inBase digits outBase =
    if invalidBase inBase || invalidBase outBase || invalidDigits inBase digits then
        Nothing
    else
        digits
            |> toInBaseInt inBase
            |> toOutBaseDigits outBase
            |> Just
