module TransposeTests

open FsUnit.Xunit
open Xunit

open Transpose

[<Fact>]
let ``Empty string`` () =
    let lines: string list = []
    let expected: string list = []
    transpose lines |> should equal expected

[<Fact>]
let ``Two characters in a row`` () =
    let lines = ["A1"]
    let expected = 
        [ "A";
          "1" ]
    transpose lines |> should equal expected

[<Fact>]
let ``Two characters in a column`` () =
    let lines = 
        [ "A";
          "1" ]
    let expected = ["A1"]
    transpose lines |> should equal expected

[<Fact>]
let ``Simple`` () =
    let lines = 
        [ "ABC";
          "123" ]
    let expected = 
        [ "A1";
          "B2";
          "C3" ]
    transpose lines |> should equal expected

[<Fact>]
let ``Single line`` () =
    let lines = ["Single line."]
    let expected = 
        [ "S";
          "i";
          "n";
          "g";
          "l";
          "e";
          " ";
          "l";
          "i";
          "n";
          "e";
          "." ]
    transpose lines |> should equal expected

[<Fact>]
let ``First line longer than second line`` () =
    let lines = 
        [ "The fourth line.";
          "The fifth line." ]
    let expected = 
        [ "TT";
          "hh";
          "ee";
          "  ";
          "ff";
          "oi";
          "uf";
          "rt";
          "th";
          "h ";
          " l";
          "li";
          "in";
          "ne";
          "e.";
          "." ]
    transpose lines |> should equal expected

[<Fact>]
let ``Second line longer than first line`` () =
    let lines = 
        [ "The first line.";
          "The second line." ]
    let expected = 
        [ "TT";
          "hh";
          "ee";
          "  ";
          "fs";
          "ie";
          "rc";
          "so";
          "tn";
          " d";
          "l ";
          "il";
          "ni";
          "en";
          ".e";
          " ." ]
    transpose lines |> should equal expected

[<Fact>]
let ``Mixed line length`` () =
    let lines = 
        [ "The longest line.";
          "A long line.";
          "A longer line.";
          "A line." ]
    let expected = 
        [ "TAAA";
          "h   ";
          "elll";
          " ooi";
          "lnnn";
          "ogge";
          "n e.";
          "glr";
          "ei ";
          "snl";
          "tei";
          " .n";
          "l e";
          "i .";
          "n";
          "e";
          "." ]
    transpose lines |> should equal expected

[<Fact>]
let ``Square`` () =
    let lines = 
        [ "HEART";
          "EMBER";
          "ABUSE";
          "RESIN";
          "TREND" ]
    let expected = 
        [ "HEART";
          "EMBER";
          "ABUSE";
          "RESIN";
          "TREND" ]
    transpose lines |> should equal expected

[<Fact>]
let ``Rectangle`` () =
    let lines = 
        [ "FRACTURE";
          "OUTLINED";
          "BLOOMING";
          "SEPTETTE" ]
    let expected = 
        [ "FOBS";
          "RULE";
          "ATOP";
          "CLOT";
          "TIME";
          "UNIT";
          "RENT";
          "EDGE" ]
    transpose lines |> should equal expected

[<Fact>]
let ``Triangle`` () =
    let lines = 
        [ "T";
          "EE";
          "AAA";
          "SSSS";
          "EEEEE";
          "RRRRRR" ]
    let expected = 
        [ "TEASER";
          " EASER";
          "  ASER";
          "   SER";
          "    ER";
          "     R" ]
    transpose lines |> should equal expected

[<Fact>]
let ``Jagged triangle`` () =
    let lines = 
        [ "11";
          "2";
          "3333";
          "444";
          "555555";
          "66666" ]
    let expected = 
        [ "123456";
          "1 3456";
          "  3456";
          "  3 56";
          "    56";
          "    5" ]
    transpose lines |> should equal expected

