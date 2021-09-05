module RectanglesTests

open FsUnit.Xunit
open Xunit

open Rectangles

[<Fact>]
let ``No rows`` () =
    let strings = []
    rectangles strings |> should equal 0

[<Fact>]
let ``No columns`` () =
    let strings = [""]
    rectangles strings |> should equal 0

[<Fact>]
let ``No rectangles`` () =
    let strings = [" "]
    rectangles strings |> should equal 0

[<Fact>]
let ``One rectangle`` () =
    let strings = 
        [ "+-+";
          "| |";
          "+-+" ]
    rectangles strings |> should equal 1

[<Fact>]
let ``Two rectangles without shared parts`` () =
    let strings = 
        [ "  +-+";
          "  | |";
          "+-+-+";
          "| |  ";
          "+-+  " ]
    rectangles strings |> should equal 2

[<Fact>]
let ``Five rectangles with shared parts`` () =
    let strings = 
        [ "  +-+";
          "  | |";
          "+-+-+";
          "| | |";
          "+-+-+" ]
    rectangles strings |> should equal 5

[<Fact>]
let ``Rectangle of height 1 is counted`` () =
    let strings = 
        [ "+--+";
          "+--+" ]
    rectangles strings |> should equal 1

[<Fact>]
let ``Rectangle of width 1 is counted`` () =
    let strings = 
        [ "++";
          "||";
          "++" ]
    rectangles strings |> should equal 1

[<Fact>]
let ``1x1 square is counted`` () =
    let strings = 
        [ "++";
          "++" ]
    rectangles strings |> should equal 1

[<Fact>]
let ``Only complete rectangles are counted`` () =
    let strings = 
        [ "  +-+";
          "    |";
          "+-+-+";
          "| | -";
          "+-+-+" ]
    rectangles strings |> should equal 1

[<Fact>]
let ``Rectangles can be of different sizes`` () =
    let strings = 
        [ "+------+----+";
          "|      |    |";
          "+---+--+    |";
          "|   |       |";
          "+---+-------+" ]
    rectangles strings |> should equal 3

[<Fact>]
let ``Corner is required for a rectangle to be complete`` () =
    let strings = 
        [ "+------+----+";
          "|      |    |";
          "+------+    |";
          "|   |       |";
          "+---+-------+" ]
    rectangles strings |> should equal 2

[<Fact>]
let ``Large input with many rectangles`` () =
    let strings = 
        [ "+---+--+----+";
          "|   +--+----+";
          "+---+--+    |";
          "|   +--+----+";
          "+---+--+--+-+";
          "+---+--+--+-+";
          "+------+  | |";
          "          +-+" ]
    rectangles strings |> should equal 60

