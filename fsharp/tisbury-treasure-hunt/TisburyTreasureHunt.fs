module TisburyTreasureHunt

open System.Globalization

let getCoordinate line = snd line

let convertCoordinate (coordinate: string): int * char = 
    (CharUnicodeInfo.GetDigitValue coordinate[0], coordinate[1])

let compareRecords (azarasData: string * string) (ruisData: string * (int * char) * string) : bool =
    let azarasCoordinate = snd azarasData
    let _, (ruisCoordinateDigit, ruisCoordinateChar), _ = ruisData
    azarasCoordinate = $"{ruisCoordinateDigit}{ruisCoordinateChar}"

let createRecord (azarasData: string * string) (ruisData: string * (int * char) * string) : (string * string * string * string) =
    if compareRecords azarasData ruisData then
        let coordinate, _, quadrant = ruisData
        (snd azarasData, coordinate, quadrant, fst azarasData)
    else
        ("", "", "", "") 
