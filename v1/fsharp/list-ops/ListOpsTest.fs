module ListOpsTest

open NUnit.Framework

open ListOps

let big = 100000
let odd x = x % 2 = 1

[<Test>]
let ``length of empty list`` () =
    Assert.That(length [], Is.EqualTo(0))

[<Test>]
let ``length of non-empty list`` () =
    Assert.That(length [1 .. 4], Is.EqualTo(4))

[<Test>]
let ``length of large list`` () =
    Assert.That(length [1 .. big], Is.EqualTo(big))

[<Test>]
let ``reverse of empty list`` () =
    Assert.That(reverse [], Is.EqualTo([]))

[<Test>]
let ``reverse of non-empty list`` () =
    Assert.That(reverse [1 .. 100], Is.EqualTo([100 .. -1 .. 1]))

[<Test>]
let ``map of empty list`` () =
    Assert.That(map ((+) 1) [], Is.EqualTo([]))

[<Test>]
let ``map of non-empty list`` () =
    Assert.That(map ((+) 1) [1 .. 2 .. 7], Is.EqualTo([2 .. 2 .. 8]))

[<Test>]
let ``filter of empty list`` () =
    Assert.That(filter id [], Is.EqualTo([]))

[<Test>]
let ``filter of normal list`` () =
    Assert.That(filter odd [1 .. 4], Is.EqualTo([1; 3]))

[<Test>]
let ``foldl of empty list`` () =
    Assert.That(foldl (+) 0 [], Is.EqualTo(0))

[<Test>]
let ``foldl of non-empty list`` () =
    Assert.That(foldl (+) -3 [1 .. 4], Is.EqualTo(7))

[<Test>]
let ``foldl of huge list`` () =
    Assert.That(foldl (+) 0 [1 .. big], Is.EqualTo(big * (big + 1) / 2))

[<Test>]
let ``foldl with non-commutative function`` () =
    Assert.That(foldl (-) 10 [1 .. 4], Is.EqualTo(0))

[<Test>]
let ``foldl is not just foldr . flip`` () =
    Assert.That(foldl (fun acc item -> item :: acc) [] (List.ofSeq "asdf"), Is.EqualTo(List.ofSeq "fdsa"))

[<Test>]
let ``foldr as id`` () =
    Assert.That(foldr (fun item acc -> item :: acc) [] [1 .. big], Is.EqualTo([1 .. big]))

[<Test>]
let ``foldr as append`` () =
    Assert.That(foldr (fun item acc -> item :: acc) [100 .. big] [1 .. 99], Is.EqualTo([1 .. big]))

[<Test>]
let ``append of empty lists`` () =
    Assert.That(append [] [], Is.EqualTo([]))

[<Test>]
let ``append of empty and non-empty lists`` () =
    Assert.That(append [] [1 .. 4], Is.EqualTo([1 .. 4]))

[<Test>]
let ``append of non-empty and empty lists`` () =
    Assert.That(append [1 .. 4] [], Is.EqualTo([1 .. 4]))

[<Test>]
let ``append of non-empty lists`` () =
    Assert.That(append [1 .. 3] [4; 5], Is.EqualTo([1 .. 5]))

[<Test>]
let ``append of large lists`` () =
    Assert.That(append [1 .. (big / 2)] [1 + big / 2 .. big], Is.EqualTo([1 .. big]))

[<Test>]
let ``concat of no lists`` () =
    Assert.That(concat [], Is.EqualTo([]))

[<Test>]
let ``concat of list of lists`` () =
    Assert.That(concat [[1; 2]; [3]; []; [4; 5; 6]], Is.EqualTo([1 .. 6]))

[<Test>]
let ``concat of large list of small lists`` () =
    Assert.That(concat (map (fun x -> [x]) [1 .. big]), Is.EqualTo([1 .. big]))