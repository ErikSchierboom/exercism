module AtbashTests

open NUnit.Framework
open Atbash

[<TestCase("no", ExpectedResult = "ml")>]
[<TestCase("yes", ExpectedResult = "bvh")>]
[<TestCase("OMG", ExpectedResult = "lnt")>]
[<TestCase("mindblowingly", ExpectedResult = "nrmwy oldrm tob")>]
[<TestCase("Testing, 1 2 3, testing.", ExpectedResult = "gvhgr mt123 gvhgr mt")>]
[<TestCase("Truth is fiction.", ExpectedResult = "gifgs rhurx grlm")>]
[<TestCase("The quick brown fox jumps over the lazy dog.", ExpectedResult = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")>]
let ``Encodes words using atbash cipher`` (words: string) =        
    encode words