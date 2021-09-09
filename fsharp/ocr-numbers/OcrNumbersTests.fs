module OcrNumbersTests

open FsUnit.Xunit
open Xunit

open OcrNumbers

[<Fact>]
let ``Recognizes 0`` () =
    let rows = 
        [ " _ ";
          "| |";
          "|_|";
          "   " ]
    convert rows |> should equal (Some "0")

[<Fact>]
let ``Recognizes 1`` () =
    let rows = 
        [ "   ";
          "  |";
          "  |";
          "   " ]
    convert rows |> should equal (Some "1")

[<Fact>]
let ``Unreadable but correctly sized inputs return ?`` () =
    let rows = 
        [ "   ";
          "  _";
          "  |";
          "   " ]
    convert rows |> should equal (Some "?")

[<Fact>]
let ``Input with a number of lines that is not a multiple of four raises an error`` () =
    let rows = 
        [ " _ ";
          "| |";
          "   " ]
    convert rows |> should equal None

[<Fact>]
let ``Input with a number of columns that is not a multiple of three raises an error`` () =
    let rows = 
        [ "    ";
          "   |";
          "   |";
          "    " ]
    convert rows |> should equal None

[<Fact>]
let ``Recognizes 110101100`` () =
    let rows = 
        [ "       _     _        _  _ ";
          "  |  || |  || |  |  || || |";
          "  |  ||_|  ||_|  |  ||_||_|";
          "                           " ]
    convert rows |> should equal (Some "110101100")

[<Fact>]
let ``Garbled numbers in a string are replaced with ?`` () =
    let rows = 
        [ "       _     _           _ ";
          "  |  || |  || |     || || |";
          "  |  | _|  ||_|  |  ||_||_|";
          "                           " ]
    convert rows |> should equal (Some "11?10?1?0")

[<Fact>]
let ``Recognizes 2`` () =
    let rows = 
        [ " _ ";
          " _|";
          "|_ ";
          "   " ]
    convert rows |> should equal (Some "2")

[<Fact>]
let ``Recognizes 3`` () =
    let rows = 
        [ " _ ";
          " _|";
          " _|";
          "   " ]
    convert rows |> should equal (Some "3")

[<Fact>]
let ``Recognizes 4`` () =
    let rows = 
        [ "   ";
          "|_|";
          "  |";
          "   " ]
    convert rows |> should equal (Some "4")

[<Fact>]
let ``Recognizes 5`` () =
    let rows = 
        [ " _ ";
          "|_ ";
          " _|";
          "   " ]
    convert rows |> should equal (Some "5")

[<Fact>]
let ``Recognizes 6`` () =
    let rows = 
        [ " _ ";
          "|_ ";
          "|_|";
          "   " ]
    convert rows |> should equal (Some "6")

[<Fact>]
let ``Recognizes 7`` () =
    let rows = 
        [ " _ ";
          "  |";
          "  |";
          "   " ]
    convert rows |> should equal (Some "7")

[<Fact>]
let ``Recognizes 8`` () =
    let rows = 
        [ " _ ";
          "|_|";
          "|_|";
          "   " ]
    convert rows |> should equal (Some "8")

[<Fact>]
let ``Recognizes 9`` () =
    let rows = 
        [ " _ ";
          "|_|";
          " _|";
          "   " ]
    convert rows |> should equal (Some "9")

[<Fact>]
let ``Recognizes string of decimal numbers`` () =
    let rows = 
        [ "    _  _     _  _  _  _  _  _ ";
          "  | _| _||_||_ |_   ||_||_|| |";
          "  ||_  _|  | _||_|  ||_| _||_|";
          "                              " ]
    convert rows |> should equal (Some "1234567890")

[<Fact>]
let ``Numbers separated by empty lines are recognized. Lines are joined by commas.`` () =
    let rows = 
        [ "    _  _ ";
          "  | _| _|";
          "  ||_  _|";
          "         ";
          "    _  _ ";
          "|_||_ |_ ";
          "  | _||_|";
          "         ";
          " _  _  _ ";
          "  ||_||_|";
          "  ||_| _|";
          "         " ]
    convert rows |> should equal (Some "123,456,789")

