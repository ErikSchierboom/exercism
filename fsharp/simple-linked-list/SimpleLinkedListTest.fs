﻿module SimpleLinkedListTest

open NUnit.Framework

open SimpleLinkedList

[<Test>]
let ``Empty list`` () =
    let list = nil
    Assert.That(isNil list, Is.True)

[<Test>]
let ``Single item list value`` () =
    let list = create 1 nil
    Assert.That(datum list, Is.EqualTo(1))
        
[<Test>]
let ``Single item list has no next item`` () =
    let list = create 1 nil
    Assert.That(next list |> isNil, Is.True)
        
[<Test>]
let ``Two item list first value`` () =
    let list = create 2 (create 1 nil)
    Assert.That(datum list, Is.EqualTo(2))
    
[<Test>]
let ``Two item list second value`` () =
    let list = create 2 (create 1 nil)
    Assert.That(next list |> datum, Is.EqualTo(1))
    
[<Test>]
let ``Two item list second item has no next`` () =
    let list = create 2 (create 1 nil)
    Assert.That(next list |> next |> isNil, Is.True)
        
[<Test>]
let ``To list`` () =
    let values = create 2 (create 1 nil) |> toList
    Assert.That(values, Is.EqualTo([2; 1]))
        
[<Test>]
let ``From list`` () =
    let list = fromList [11; 7; 5; 3; 2]
    Assert.That(list |> datum, Is.EqualTo(11))
    Assert.That(list |> next |> datum, Is.EqualTo(7))
    Assert.That(list |> next |> next |> datum, Is.EqualTo(5))
    Assert.That(list |> next |> next |> next |> datum, Is.EqualTo(3))
    Assert.That(list |> next |> next |> next |> next |> datum, Is.EqualTo(2))
    
[<TestCase(1)>]
[<TestCase(2)>]
[<TestCase(10)>]
[<TestCase(100)>]
let ``Reverse`` (length: int) =
    let values = [1..length]
    let list = fromList values
    let reversed = reverse list
    Assert.That(reversed |> toList, Is.EqualTo(values |> List.rev))
    
[<TestCase(1)>]
[<TestCase(2)>]
[<TestCase(10)>]
[<TestCase(100)>]
let ``Roundtrip`` (length: int) =
    let values = [1..length]
    let listValues = fromList values
    Assert.That(listValues |> toList, Is.EqualTo(values))