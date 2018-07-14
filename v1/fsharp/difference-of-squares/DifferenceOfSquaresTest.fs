module DifferenceOfSquaresTests

open NUnit.Framework
open DifferenceOfSquares
    
[<Test>]
let ``Square of sums to 5`` () =
    Assert.That(squareOfSums 5, Is.EqualTo(225))

[<Test>]
let ``Sum of squares to 5`` () =
    Assert.That(sumOfSquares 5, Is.EqualTo(55))

[<Test>]
let ``Difference of sums to 5`` () =
    Assert.That(difference 5, Is.EqualTo(170))

[<Test>]
let ``Square of sums to 10`` () =
    Assert.That(squareOfSums 10, Is.EqualTo(3025))

[<Test>]
let ``Sum of squares to 10`` () =
    Assert.That(sumOfSquares 10, Is.EqualTo(385))

[<Test>]
let ``Difference of sums to 10`` () =
    Assert.That(difference 10, Is.EqualTo(2640))

[<Test>]
let ``Square of sums to 100`` () =
    Assert.That(squareOfSums 100, Is.EqualTo(25502500))

[<Test>]
let ``Sum of squares to 100`` () =
    Assert.That(sumOfSquares 100, Is.EqualTo(338350))

[<Test>]
let ``Difference of sums to 100`` () =
    Assert.That(difference 100, Is.EqualTo(25164150))