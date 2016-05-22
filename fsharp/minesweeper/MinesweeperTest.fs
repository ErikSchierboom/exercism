module MinesweeperTest

open NUnit.Framework

open Minesweeper

let concat = List.reduce (fun x y -> x + "\n" + y)

[<Test>]
let ``Zero size board`` () =
    let actual = ""
    let expected = ""
    Assert.That(annotate actual, Is.EqualTo(expected))

[<Test>]
let ``Empty board`` () =
    let actual = 
        ["   ";
         "   ";
         "   "]
        |> concat

    let expected = 
        ["   ";
         "   ";
         "   "]
        |> concat

    Assert.That(annotate actual, Is.EqualTo(expected))

[<Test>]
let ``Board full of mines`` () =
    let actual = 
        ["***";
         "***";
         "***"]
        |> concat

    let expected = 
        ["***";
         "***";
         "***"]
        |> concat

    Assert.That(annotate actual, Is.EqualTo(expected))

[<Test>]
let ``Surrounded`` () =    
    let actual = 
        ["***";
         "* *";
         "***"]
        |> concat

    let expected = 
        ["***";
         "*8*";
         "***"]
        |> concat

    Assert.That(annotate actual, Is.EqualTo(expected))

[<Test>]
let ``Horizontal line`` () =    
    let actual = [" * * "] |> concat
    let expected = ["1*2*1"] |> concat

    Assert.That(annotate actual, Is.EqualTo(expected))

[<Test>]
let ``Vertical line`` () =   
    let actual = 
        [" ";
         "*";
         " ";
         "*";
         " "]
        |> concat

    let expected = 
        ["1";
         "*";
         "2";
         "*";
         "1"]
        |> concat

    Assert.That(annotate actual, Is.EqualTo(expected))

[<Test>]
let ``Cross`` () = 
    let actual = 
        ["  *  ";
         "  *  ";
         "*****";
         "  *  ";
         "  *  "]
        |> concat

    let expected = 
        [" 2*2 ";
         "25*52";
         "*****";
         "25*52";
         " 2*2 "]
        |> concat

    Assert.That(annotate actual, Is.EqualTo(expected))

