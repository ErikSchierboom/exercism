module BinarySearchTreeTest

open NUnit.Framework
open BinarySearchTree

[<Test>]
let ``Data is retained`` () =
    let tree = singleton 4
    Assert.That(tree |> value, Is.EqualTo(4))

[<Test>]
let ``Inserting less`` () =
    let tree = singleton 4 |> insert 2
    Assert.That(tree |> value, Is.EqualTo(4))
    Assert.That(tree |> left |> Option.map value, Is.EqualTo(Some 2))

[<Test>]
let ``Inserting same`` () =
    let tree = singleton 4 |> insert 4
    Assert.That(tree |> value, Is.EqualTo(4))
    Assert.That(tree |> left |> Option.map value, Is.EqualTo(Some 4))

[<Test>]
let ``Inserting greater()`` =
    let tree = singleton 4 |> insert 5
    Assert.That(tree |> value, Is.EqualTo(4))
    Assert.That(tree |> right |> Option.map value, Is.EqualTo(Some 5))

[<Test>]
let ``Complex tree()`` =
    let tree = fromList [4; 2; 6; 1; 3; 7; 5]
    Assert.That(tree |> value, Is.EqualTo(4))
    Assert.That(tree |> left |> Option.map value, Is.EqualTo(2))
    Assert.That(tree |> left |> Option.bind (fun x -> x |> left) |> Option.map value, Is.EqualTo(Some 1))
    Assert.That(tree |> left |> Option.bind (fun x -> x |> right) |> Option.map value, Is.EqualTo(Some 3))
    Assert.That(tree |> right |> Option.map value, Is.EqualTo(6))
    Assert.That(tree |> right |> Option.bind (fun x -> x |> left) |> Option.map value, Is.EqualTo(Some 5))
    Assert.That(tree |> right |> Option.bind (fun x -> x |> right) |> Option.map value, Is.EqualTo(7))

[<Test>]
let ``Iterating one element`` () =
    let elements = singleton 4 |> toList
    Assert.That(elements, Is.EqualTo([4]))

[<Test>]
let ``Iterating over smaller element`` () =
    let elements = fromList [4; 2] |> toList
    Assert.That(elements, Is.EqualTo([2; 4]))

[<Test>]
let ``Iterating over larger element`` () =
    let elements = fromList [4; 5] |> toList
    Assert.That(elements, Is.EqualTo([4; 5]))

[<Test>]
let ``Iterating over complex element`` () =
    let elements = fromList [4; 2; 1; 3; 6; 7; 5] |> toList
    Assert.That(elements, Is.EqualTo([1; 2; 3; 4; 5; 6; 7])) 
