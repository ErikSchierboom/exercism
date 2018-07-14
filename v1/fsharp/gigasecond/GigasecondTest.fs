module GigasecondTest

open NUnit.Framework
open Gigasecond
open System
    
[<Test>]
let ``First date`` () =
    let input = DateTime(2011, 4, 25)
    Assert.That(gigasecond input, Is.EqualTo(DateTime(2043, 1, 1)))

[<Test>]
let ``Another date`` () =
    let input = DateTime(1977, 6, 13)
    Assert.That(gigasecond input, Is.EqualTo(DateTime(2009, 2, 19)))

[<Test>]
let ``Yet another date`` () =
    let input = DateTime(1959, 7, 19)
    Assert.That(gigasecond input, Is.EqualTo(DateTime(1991, 3, 27)))