module Transpose exposing (transpose)


pair : a -> b -> ( a, b )
pair x y =
    ( x, y )


charactersWithColumn : String -> List ( Int, Char )
charactersWithColumn str =
    str
        |> String.toList
        |> List.indexedMap pair


column : List ( Int, Char ) -> Int -> String
column charsWithColumn n =
    charsWithColumn
        |> List.filter (\( column, _ ) -> column == n)
        |> List.map Tuple.second
        |> String.fromList


transpose : List String -> List String
transpose lines =
    let
        subsequentRowsMaximumLength n =
            lines
                |> List.drop n
                |> List.map String.length
                |> List.maximum
                |> Maybe.withDefault 0

        padLine row line =
            String.padRight (subsequentRowsMaximumLength row) ' ' line

        paddedLines =
            List.indexedMap padLine lines

        charsWithColumn =
            List.concatMap charactersWithColumn paddedLines

        numberOfColumns =
            charsWithColumn
                |> List.map Tuple.first
                |> List.maximum
                |> Maybe.withDefault -1
    in
        List.range 0 numberOfColumns
            |> List.map (column charsWithColumn)
