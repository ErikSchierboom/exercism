module SumOfMultiplesTest

open NUnit.Framework
open Example

[<TestFixture>]
type ExampleTest() =
    let mutable example = Example()
    
    [<Test>]
    [<TestCase(2, 2, 4)>]
    [<TestCase(12, 24, 36)>]
    [<TestCase(100, 1, 101)>]
    [<TestCase(2, -2, 0)>]
    member tc.Can_add(x, y, expected) = 
        Assert.That(example.Add(x, y), Is.EqualTo(expected))