﻿module PhoneNumberTest

open NUnit.Framework

open PhoneNumber

[<Test>]
let ``Cleans number`` () =
    Assert.That(parsePhoneNumber "(123) 456-7890", Is.EqualTo(Some "1234567890"))

[<Test>]
let ``Cleans parsePhoneNumber with dots`` () =
    Assert.That(parsePhoneNumber "123.456.7890", Is.EqualTo(Some "1234567890"))

[<Test>]
let ``Valid when 11 digits and first is 1`` () =
    Assert.That(parsePhoneNumber "11234567890", Is.EqualTo(Some "1234567890"))

[<Test>]
let ``Invalid when 11 digits`` () =
    Assert.That(parsePhoneNumber "21234567890", Is.EqualTo(None))

[<Test>]
let ``Invalid when 9 digits`` () =
    Assert.That(parsePhoneNumber "123456789", Is.EqualTo(None))

[<Test>]
let ``Invalid when 12 digits`` () =
    Assert.That(parsePhoneNumber "123456789012", Is.EqualTo(None))

[<Test>]
let ``Invalid when empty`` () =
    Assert.That(parsePhoneNumber "", Is.EqualTo(None))

[<Test>]
let ``Invalid when no digits present`` () =
    Assert.That(parsePhoneNumber " (-) ", Is.EqualTo(None))

[<Test>]
let ``Valid with leading characters`` () =
    Assert.That(parsePhoneNumber "my parsePhoneNumber is 123 456 7890", Is.EqualTo(Some "1234567890"))

[<Test>]
let ``Valid with trailing characters`` () =
    Assert.That(parsePhoneNumber "123 456 7890 - bob", Is.EqualTo(Some "1234567890"))


