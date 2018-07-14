module ZipperTest

open NUnit.Framework

open Zipper

let empty = None
let bt v l r = tree v l r |> Some

let leaf v = bt v None None

let t1 = tree 1 (bt 2 empty    (leaf 3)) (leaf 4)
let t2 = tree 1 (bt 5 empty    (leaf 3)) (leaf 4)
let t3 = tree 1 (bt 2 (leaf 5) (leaf 3)) (leaf 4)
let t4 = tree 1 (leaf 2)                 (leaf 4)

[<Test>]
let ``Data is retained``() =
    Assert.That(toTree (fromTree t1), Is.EqualTo(t1))

[<Test>]
let ``left, right and value``() =
    Assert.That(t1 |> fromTree |> left |> Option.get |> right |> Option.get |> value, Is.EqualTo(3))

[<Test>]
let ``Dead end``() =
    Assert.That(t1 |> fromTree |> left |> Option.get |> left, Is.EqualTo(None))

[<Test>]
let ``Tree from deep focus``() =
    Assert.That(t1 |> fromTree |> left |> Option.get |> right |> Option.get |> toTree, Is.EqualTo(t1))

[<Test>]
let ``setValue``() =
    Assert.That(t1 |> fromTree |> left |> Option.get |> setValue 5 |> toTree, Is.EqualTo(t2))

[<Test>]
let ``setLeft with Some``() =
    Assert.That(t1 |> fromTree |> left |> Option.get |> setLeft (tree 5 None None |> Some) |> toTree, Is.EqualTo(t3))

[<Test>]
let ``setRight with None``() =
    Assert.That(t1 |> fromTree |> left |> Option.get |> setRight None |> toTree, Is.EqualTo(t4))

[<Test>]
let ``Different paths to same zipper``() =
    Assert.That(t1 |> fromTree |> left |> Option.get |> up |> Option.get |> right, Is.EqualTo(t1 |> fromTree |> right))