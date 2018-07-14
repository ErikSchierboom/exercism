module HelloWorldTest

open NUnit.Framework

open HelloWorld

[<Test>]
let ``No name`` () =
    Assert.That(hello None, Is.EqualTo("Hello, World!"))

[<Test>]
let ``Sample name`` () =
    Assert.That(hello (Some "Alice"), Is.EqualTo("Hello, Alice!"))

[<Test>]
let ``Other sample name`` () =
    Assert.That(hello (Some "Bob"), Is.EqualTo("Hello, Bob!"))