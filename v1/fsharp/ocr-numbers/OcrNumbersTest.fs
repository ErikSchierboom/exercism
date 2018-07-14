module OcrNumbersTest

open NUnit.Framework

open OcrNumbers

[<Test>]
let ``Recognizes zero`` () = 
    let converted = convert (" _ " + "\n" +
                              "| |" + "\n" +
                              "|_|" + "\n" +
                              "   ")
    Assert.That(converted, Is.EqualTo("0"))

[<Test>]
let ``Recognizes one`` () = 
    let converted = convert ("   " + "\n" +
                             "  |" + "\n" +
                             "  |" + "\n" +
                             "   ")
    Assert.That(converted, Is.EqualTo("1"))

[<Test>]
let ``Recognizes two`` () = 
    let converted = convert (" _ " + "\n" +
                             " _|" + "\n" +
                             "|_ " + "\n" +
                             "   ")
    Assert.That(converted, Is.EqualTo("2"))

[<Test>]
let ``Recognizes three`` () = 
    let converted = convert (" _ " + "\n" +
                             " _|" + "\n" +
                             " _|" + "\n" +
                             "   ")
    Assert.That(converted, Is.EqualTo("3"))

[<Test>]
let ``Recognizes four`` () = 
    let converted = convert ("   " + "\n" +
                             "|_|" + "\n" +
                             "  |" + "\n" +
                             "   ")
    Assert.That(converted, Is.EqualTo("4"))

[<Test>]
let ``Recognizes five`` () = 
    let converted = convert (" _ " + "\n" +
                             "|_ " + "\n" +
                             " _|" + "\n" +
                             "   ")
    Assert.That(converted, Is.EqualTo("5"))

[<Test>]
let ``Recognizes six`` () = 
    let converted = convert (" _ " + "\n" +
                             "|_ " + "\n" +
                             "|_|" + "\n" +
                             "   ")
    Assert.That(converted, Is.EqualTo("6"))

[<Test>]
let ``Recognizes seven`` () = 
    let converted = convert (" _ " + "\n" +
                             "  |" + "\n" +
                             "  |" + "\n" +
                             "   ")
    Assert.That(converted, Is.EqualTo("7"))

[<Test>]
let ``Recognizes eight`` () = 
    let converted = convert (" _ " + "\n" +
                             "|_|" + "\n" +
                             "|_|" + "\n" +
                             "   ")
    Assert.That(converted, Is.EqualTo("8"))

[<Test>]
let ``Recognizes nine`` () = 
    let converted = convert (" _ " + "\n" +
                             "|_|" + "\n" +
                             " _|" + "\n" +
                             "   ")
    Assert.That(converted, Is.EqualTo("9"))

[<Test>]
let ``Recognizes garble`` () = 
    let converted = convert ("   " + "\n" +
                             "| |" + "\n" +
                             "| |" + "\n" +
                             "   ")
    Assert.That(converted, Is.EqualTo("?"))

[<Test>]
let ``Recognizes ten`` () = 
    let converted = convert ("    _ " + "\n" +
                             "  || |" + "\n" +
                             "  ||_|" + "\n" +
                             "       ")
    Assert.That(converted, Is.EqualTo("10"))

[<Test>]
let ``Recognizes 110101100`` () = 
    let converted = convert ("       _     _        _  _ " + "\n" +
                             "  |  || |  || |  |  || || |" + "\n" +
                             "  |  ||_|  ||_|  |  ||_||_|" + "\n" +
                             "                            ")
    Assert.That(converted, Is.EqualTo("110101100"))

[<Test>]
let ``Recognizes numbers and garble`` () = 
    let converted = convert ("       _     _           _ " + "\n" +
                             "  |  || |  || |     || || |" + "\n" +
                             "  |  | _|  ||_|  |  ||_||_|" + "\n" +
                             "                            ")
    Assert.That(converted, Is.EqualTo("11?10?1?0"))

[<Test>]
let ``Recognizes multiple rows`` () = 
    let converted = convert ("    _  _ " + "\n" +
                             "  | _| _|" + "\n" +
                             "  ||_  _|" + "\n" +
                             "          " + "\n" +
                             "    _  _ " + "\n" +
                             "|_||_ |_ " + "\n" +
                             "  | _||_|" + "\n" +
                             "          " + "\n" +
                             " _  _  _ " + "\n" +
                             "  ||_||_|" + "\n" +
                             "  ||_| _|" + "\n" +
                             "          ")
    Assert.That(converted, Is.EqualTo("123,456,789"))
