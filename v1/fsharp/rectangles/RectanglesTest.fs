module RectanglesTest

open NUnit.Framework

open System

open Rectangle

[<Test>]
let ``No rows`` () =
    let input = []
    Assert.That(rectangles input, Is.EqualTo(0))

[<Test>]
let ``No columns`` () =
    let input = [""]
    Assert.That(rectangles input, Is.EqualTo(0))

[<Test>]
let ``No rectangles`` () =
    let input = [" "]
    Assert.That(rectangles input, Is.EqualTo(0))

[<Test>]
let ``One rectangle`` () =
    let input = 
        [ "+-+";
          "| |";
          "+-+" ]        
    Assert.That(rectangles input, Is.EqualTo(1))

[<Test>]
let ``two rectangles without shared parts`` () =
    let input = 
        [ "  +-+";
          "  | |";
          "+-+-+";
          "| |  ";
          "+-+  " ]        
    Assert.That(rectangles input, Is.EqualTo(2))

[<Test>]
let ``Five rectangles with shared parts`` () =
    let input = 
        [ "  +-+";
          "  | |";
          "+-+-+";
          "| | |";
          "+-+-+" ]        
    Assert.That(rectangles input, Is.EqualTo(5))

[<Test>]
let ``Only complete rectangles are counted`` () =
    let input = 
        [ "  +-+";
          "    |";
          "+-+-+";
          "| | -";
          "+-+-+" ]       
    Assert.That(rectangles input, Is.EqualTo(1))

[<Test>]
let ``Rectangles can be of different sizes`` () =
    let input =
         ["+------+----+";
          "|      |    |";
          "+---+--+    |";
          "|   |       |";
          "+---+-------+" ]       
    Assert.That(rectangles input, Is.EqualTo(3))

[<Test>]
let ``Corner is required for a rectangle to be complete`` () =
    let input = 
        [ "+------+----+";
          "|      |    |";
          "+------+    |";
          "|   |       |";
          "+---+-------+" ]       
    Assert.That(rectangles input, Is.EqualTo(2))

[<Test>]
let ``Large input with many rectangles`` () =
    let input = 
        [ "+---+--+----+";
          "|   +--+----+";
          "+---+--+    |";
          "|   +--+----+";
          "+---+--+--+-+";
          "+---+--+--+-+";
          "+------+  | |";
          "          +-+" ]       
    Assert.That(rectangles input, Is.EqualTo(60))